//
//  MessageListView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageListController
    private var viewModel: ChatRoomViewModel
    
    init(_ viewModel: ChatRoomViewModel) {
        self.viewModel = viewModel
    }
    
    func makeUIViewController(context: Context) -> MessageListController {
        let messageListController = MessageListController(viewModel)
        return messageListController
    }
    
    func updateUIViewController(_ uiViewController: MessageListController, context: Context) {
        
    }
   
}

#Preview {
    MessageListView(ChatRoomViewModel(.placeHolder))
}
