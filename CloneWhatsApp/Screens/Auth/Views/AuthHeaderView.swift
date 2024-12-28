//
//  AuthHeaderView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 28.12.2024.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack{
            Image(.whatsapp)
                .resizable()
                .frame(width: 40, height: 40)
                
            
            Text("WhatsApp")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AuthHeaderView()
}
