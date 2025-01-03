//
//  ChatRoomViewModel.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 3.01.2025.
//

import Foundation
import Combine

final class ChatRoomViewModel: ObservableObject {
    
    @Published var textMessage: String = ""
    @Published var messages = [MessageItem]()
    private let channel: ChannelItem
    private var subscriptions = Set<AnyCancellable>()
    @Published var currentUser: UserItem?
    
    init(_ channel: ChannelItem){
        self.channel = channel
        listenToAuthState()
    }
    
    deinit {
        subscriptions.forEach{ $0.cancel() }
        subscriptions.removeAll()
        currentUser = nil
    }
    
    private func listenToAuthState() {
        AuthManager.shared.authState.receive(on: DispatchQueue.main).sink { [weak self] authState in
            switch authState {
            case .loggedIn(let currentUser):
                self?.currentUser = currentUser
                self?.getMessages()
            default:
                break
            }
        }.store(in: &subscriptions)
    }
    
    func sendMessage() {
        guard let currentUser else { return }
        MessageService.sendTextMessage(to: channel, from: currentUser, textMessage, onComplete: { [self] in
            self.textMessage = ""
        })
    }
    
    private func getMessages() {
        MessageService.getMessages(for: channel, completion: { messages in
            self.messages = messages
            print("messages: \(messages.map{ $0.text })")
        })
    }
}
