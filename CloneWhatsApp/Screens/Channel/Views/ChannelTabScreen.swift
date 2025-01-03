//
//  ChannelsTabScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct ChannelTabScreen: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel = ChannelTabViewModel()
    var body: some View {
        NavigationStack{
            List{
                archivedButton()
                
                ForEach(viewModel.channels) { channel in
                    NavigationLink {
                        ChatRoomScreen(channel: channel)
                    } label: {
                        ChannelItemView(channel: channel)
                    }
                }
                
                inboxFooterView()
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .listStyle(.plain)
            .toolbar {
                leadingNavItem()
                trailingNavItem()
            }
            .sheet(isPresented: $viewModel.showChatPartnerPickerView) {
                ChatPartnerPickerScreen(onCreate: { channel in
                    viewModel.onNewChannelCreation(channel)
                })
            }
            .navigationDestination(isPresented: $viewModel.navigateToChatRoom, destination: {
                if let newChannel = viewModel.newChannel {
                    ChatRoomScreen(channel: newChannel)
                }
            })
        }
    }
}

extension ChannelTabScreen {
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Menu {
                Button(action: {
                    
                }, label: {
                    Label("Select Chats", systemImage: "checkmark.circle")
                })
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            aiButton()
            newchatsButton()
            cameraButton()
        }
    }
    
    private func aiButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(.circle)
        })
    }
    
    private func newchatsButton() -> some View {
        Button(action: {
            viewModel.showChatPartnerPickerView = true
        }, label: {
            Image(.plus)
        })
    }
    
    private func cameraButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "camera")
        })
    }
    
    private func archivedButton() -> some View {
        Button(action: {
            
        }, label: {
            Label("Archived", systemImage: "archivebox.fill")
                .bold()
                .padding()
                .foregroundColor(Color.gray)
        })
    }
    
    private func inboxFooterView() -> some View {
        HStack{
            Image(systemName: "lock.fill")
            
            Text("Your personal message are ")
            +
            Text("end-to-end encrypted")
                .foregroundStyle(Color.blue)
        }.foregroundStyle(Color.gray)
            .font(.caption)
            .padding(.horizontal)
    }
}



#Preview {
    ChannelTabScreen()
}
