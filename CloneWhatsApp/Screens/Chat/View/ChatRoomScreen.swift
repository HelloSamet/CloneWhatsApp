//
//  ChatRoomScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        MessageListView()
        .toolbarVisibility(.hidden, for: .tabBar)
        .toolbar {
            leadingNavItems()
            trailingNavItems()
        }
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            TextInputArea()
        })
    }
}

extension ChatRoomScreen {
    
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack{
                Circle()
                    .frame(width: 35, height: 35)
                
                Text("QaUser12")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button(action: {
                
            }, label: {
                Image(systemName: "video")
            })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "phone")
            })
        }
    }
}

#Preview {
    NavigationStack{
        ChatRoomScreen()
    }
}
