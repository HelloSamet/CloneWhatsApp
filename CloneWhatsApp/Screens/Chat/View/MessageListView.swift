//
//  MessageListView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageListContreller
    
    func makeUIViewController(context: Context) -> MessageListContreller {
        let messageListController = MessageListContreller()
        return messageListController
    }
    
    func updateUIViewController(_ uiViewController: MessageListContreller, context: Context) {
        
    }
   
}

#Preview {
    MessageListView()
}
