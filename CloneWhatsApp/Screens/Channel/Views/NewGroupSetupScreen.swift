//
//  NewGroupSetupScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import SwiftUI

struct NewGroupSetupScreen: View {
    @State private var channelName: String = ""
    @ObservedObject var viewModel: ChatPartnerPickerViewModel
    var onCreate: (_ newChannel: ChannelItem) -> Void
    var body: some View {
        List {
            Section{
                channelSetUpHeaderView()
            }
            
            Section{
                Text("Disappearing Messages")
                Text("Group Permissions")
            }
            
            Section {
                SelectedChatPartnerView(users: viewModel.selectedChatPartners, onTapHandler: { user in
                    viewModel.handleItemSelection(user)
                })
            } header: {
                let count = viewModel.selectedChatPartners.count
                let maxCount = ChannelConstans.maxGroupParticipants
                Text("Participants: \(count) Of \(maxCount)")
                    .bold()
            }.listRowBackground(Color.clear)
        }
        .navigationTitle("New Group")
        .toolbar {
            trailingNavItem()
        }
    }
    
}

extension NewGroupSetupScreen {
    
    private func channelSetUpHeaderView() -> some View {
        HStack{
            profileImageView()
            
            TextField("", text: $channelName, prompt: Text("Group Name (optional)"), axis: .vertical)
        }
    }
    
    private func profileImageView() -> some View {
        Button(action: {
            
        }, label: {
            ZStack{
                Image(systemName: "camera")
                    .imageScale(.large)
                    
            }.frame(width: 60, height: 60)
                .background(Color(.systemGray5))
                .clipShape(Circle())
        })
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            createNewGroupButton()
        }
    }
    
    private func createNewGroupButton() -> some View {
        Button(action: {
            viewModel.createdGroupChannel(channelName, completion: {newChannel in
                onCreate(newChannel)
            })
        }, label: {
            Text("Create")
                .bold()
        }).disabled(viewModel.disableNextButton)
    }
}

#Preview {
    NavigationStack{
        NewGroupSetupScreen(viewModel: ChatPartnerPickerViewModel(), onCreate: { newChannel in
            
        })
    }
}
