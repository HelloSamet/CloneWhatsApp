//
//  ChatPartnerRowView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import SwiftUI

struct ChatPartnerRowView: View {
    let user: UserItem
    var body: some View {
        HStack{
            Circle().frame(width: 40, height: 40)
            
            VStack(alignment: .leading){
                Text(user.username)
                    .bold()
                    .foregroundStyle(Color.whatsAppBlack)
                
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ChatPartnerRowView(user: .placeholder)
}
