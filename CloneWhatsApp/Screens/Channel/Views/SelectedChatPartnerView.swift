//
//  SelectedChatPartnerView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import SwiftUI

struct SelectedChatPartnerView: View {
    let users: [UserItem]
    let onTapHandler: (_ user: UserItem) -> Void
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(users) { item in
                    chatPartnerView(item)
                }
            }
        }.frame(maxWidth: .infinity)
    }
    
    private func chatPartnerView(_ user: UserItem) -> some View{
        VStack{
            Circle()
                .fill(Color.gray)
                .frame(width: 60, height: 60)
                .overlay(alignment: .topTrailing) {
                    cancelButton(user)
                }
            
            Text(user.username)
        }
    }
    
    private func cancelButton(_ user: UserItem) -> some View {
        Button(action: {
            onTapHandler(user)
        }, label: {
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .padding(5)
                .background(Color(.systemGray2))
                .clipShape(Circle())
        })
    }
}

#Preview {
    SelectedChatPartnerView(users: UserItem.placeholders, onTapHandler: {user in 
        
    })
}
