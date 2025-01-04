//
//  ChannelsTabScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct ChannelTabScreen: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel: ChannelTabViewModel
    
    init(_ currentUser: UserItem) {
        self._viewModel = StateObject(wrappedValue: ChannelTabViewModel(currentUser))
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navRoutes){
            List{
                archivedButton()
                
                ForEach(viewModel.channels) { channel in
                    Button(action: {
                        viewModel.navRoutes.append(.chatRoom(channel))
                    }, label: {
                        ChannelItemView(channel: channel)
                    })
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
            .navigationDestination(for: ChannelTabRoutes.self) { route in
                destinationView(for: route)
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
    
    @ViewBuilder
    private func destinationView(for route: ChannelTabRoutes) -> some View {
        switch route
        {
        case .chatRoom(let channel):
            ChatRoomScreen(channel: channel)
        }
    }
    
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
    ChannelTabScreen(.placeholder)
}
