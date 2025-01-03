//
//  TextInputArea.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct TextInputArea: View {
    @Binding var textMessage: String
    let onSendHandler: () -> Void
    
    private var disableSendButton: Bool {
        return textMessage.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5){
            imagePickerButton()
                .padding(3)
            audioRecorderButton()
            messageTextField()
            sendMessageButton()
                .disabled(disableSendButton)
                .grayscale(disableSendButton ? 0.8 : 0)
        }
        .padding(.bottom)
        .padding(.horizontal, 8)
        .padding(.top, 10)
        .background(Color.whatsAppWhite)
    }
    
    private func messageTextField() -> some View {
        TextField("", text: $textMessage, axis: .vertical)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.thinMaterial))
            .overlay(textViewBorder())
    }
    
    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color(.systemGray5), lineWidth: 1)
    }
    
    private func imagePickerButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 22))
        })
    }
    
    private func audioRecorderButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "mic.fill")
                .fontWeight(.heavy)
                .imageScale(.small)
                .foregroundStyle(Color.white)
                .padding(6)
                .background(Color.blue)
                .clipShape(Circle())
                .padding(.horizontal, 3)
        })
    }
    
    private func sendMessageButton() -> some View {
        Button(action: {
            onSendHandler()
        }, label: {
            Image(systemName: "arrow.up")
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
                .padding(6)
                .background(Color.blue)
                .clipShape(Circle())
        })
    }
}

#Preview {
    TextInputArea(textMessage: .constant(""), onSendHandler: {
        
    })
}
