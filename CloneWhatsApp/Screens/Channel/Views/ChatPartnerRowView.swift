//
//  ChatPartnerRowView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import SwiftUI

struct ChatPartnerRowView<Content: View>: View {
    let user: UserItem
    private let trailingItems: Content
    
    init(user: UserItem, @ViewBuilder trailingItems: () -> Content = { EmptyView() }) {
        self.user = user
        self.trailingItems = trailingItems()
    }
    var body: some View {
        HStack{
            CircularProfileImageView(user.profileImageUrl, size: .xSmall)
            
            VStack(alignment: .leading){
                Text(user.username)
                    .bold()
                    .foregroundStyle(Color.whatsAppBlack)
                
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            trailingItems
        }
    }
}

#Preview {
    ChatPartnerRowView(user: .placeholder) {
        
    }
}
