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
                Text("Participants: \(viewModel.selectedChatPartners.count) Of \(ChannelConstans.maxGroupParticipants)")
                    .bold()
            }.listRowBackground(Color.clear)
        }
        .navigationTitle("New Group")
        .toolbar {
            trailingNavItem()
        }
    }
    
    private func channelSetUpHeaderView() -> some View {
        HStack{
            Circle().frame(width: 60, height: 60)
            
            TextField("", text: $channelName, prompt: Text("Group Name (optional)"), axis: .vertical)
        }
    }
}

extension NewGroupSetupScreen {
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            createNewGroupButton()
        }
    }
    
    private func createNewGroupButton() -> some View {
        Button(action: {
            
        }, label: {
            Text("Create")
                .bold()
        }).disabled(viewModel.disableNextButton)
    }
}

#Preview {
    NavigationStack{
        NewGroupSetupScreen(viewModel: ChatPartnerPickerViewModel())
    }
}
