//
//  AddGroupChatPartnersScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import SwiftUI

struct GroupPartnerPickerScreen: View {
    @ObservedObject var viewModel: ChatPartnerPickerViewModel
    @State private var searchText: String = ""
    var body: some View {
        List{
            if viewModel.showSelectedUsers {
                SelectedChatPartnerView(users: viewModel.selectedChatPartners, onTapHandler: { user in
                    viewModel.handleItemSelection(user)
                })
            }
            Section {
                ForEach(viewModel.users) { item in
                    Button(action: {
                        viewModel.handleItemSelection(item)
                    }, label: {
                        chatPartnerRowView(item)
                    })
                }
            }
            
            if  viewModel.isPaginatable {
                loadMoreUsersView()
            }
        }
        .animation(.easeInOut, value: viewModel.showSelectedUsers)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search name or number"
        )
        .toolbar {
            titleView()
            trailingNavItem()
        }
    }
    
    private func chatPartnerRowView(_ user: UserItem) -> some View {
        ChatPartnerRowView(user: user, trailingItems: {
            Spacer()
            let isSelected = viewModel.isUserSelected(user)
            let imageName = isSelected ? "checkmark.circle.fill" : "circle"
            let foregroundStyle = isSelected ? Color.blue : Color(.systemGray4)
            Image(systemName: imageName)
                .foregroundStyle(foregroundStyle)
                .imageScale(.large)
        })
    }
    
    private func loadMoreUsersView() -> some View {
        ProgressView()
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            .task {
                await viewModel.fetchUsers()
            }
    }
}

extension GroupPartnerPickerScreen {
    @ToolbarContentBuilder
    private func titleView() -> some ToolbarContent {
        ToolbarItem(placement: .principal){
            VStack{
                Text("Add Participants")
                    .bold()
                let count = viewModel.selectedChatPartners.count
                let maxCount = ChannelConstans.maxGroupParticipants
                Text("\(count)/\(maxCount)")
                    .foregroundStyle(Color.gray)
                    .font(.footnote)
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            nextButton()
        }
    }
    
    private func nextButton() -> some View {
        Button(action: {
            viewModel.navStack.append(.setUpGroupChat)
        }, label: {
            Text("Next")
                .bold()
        }).disabled(viewModel.disableNextButton)
    }
}

#Preview {
    NavigationStack{
        GroupPartnerPickerScreen(viewModel: ChatPartnerPickerViewModel())
    }
}
