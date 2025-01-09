//
//  MessageItem.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct MessageItem: Identifiable {
    let id: String
    let isGroupChat: Bool
    let text: String
    let type: MessageType
    let ownerUid: String
    let timeStampt: Date
    var sender: UserItem?
    let thumbnailUrl: String?
    
    var direction: MessageDirection {
        return ownerUid == Auth.auth().currentUser?.uid ? .sent : .recived
    }
    
    static let sentPlaceHolder = MessageItem(id: UUID().uuidString, isGroupChat: true, text: "Holy Spagetti", type: .text, ownerUid: "1", timeStampt: Date(), thumbnailUrl: nil)
    static let recivedPlaceHolder = MessageItem(id: UUID().uuidString, isGroupChat: false, text: "Hey dude whats up", type: .text, ownerUid: "2", timeStampt: Date(), thumbnailUrl: nil)
    
    var alignment: Alignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
    
    var showGroupPartnerInfo: Bool {
        return isGroupChat && direction == .recived
    }
    
    var leadingPadding: CGFloat {
        return direction == .recived ? 0 : horizontalPadding
    }
    
    var trailingPadding: CGFloat {
        return direction == .recived ? horizontalPadding : 0
    }
    
    private let horizontalPadding: CGFloat = 25
    
    static let stubMessage: [MessageItem] = [
        MessageItem(id: UUID().uuidString, isGroupChat: false, text: "Hi there", type: .text, ownerUid: "3", timeStampt: Date(), thumbnailUrl: nil),
        MessageItem(id: UUID().uuidString, isGroupChat: true, text: "Check out this photo", type: .photo, ownerUid: "4", timeStampt: Date(), thumbnailUrl: nil),
        MessageItem(id: UUID().uuidString, isGroupChat: false, text: "Play out this video", type: .video, ownerUid: "5", timeStampt: Date(), thumbnailUrl: nil),
        MessageItem(id: UUID().uuidString, isGroupChat: false, text: "", type: .audio, ownerUid: "6", timeStampt: Date(), thumbnailUrl: nil)
    ]
}

extension MessageItem {
    init(id: String, isGroupChat: Bool, dict: [String: Any]){
        self.id = id
        self.isGroupChat = isGroupChat
        self.text = dict[.text] as? String ?? ""
        let type = dict[.type] as? String ?? "text"
        self.type = MessageType(type) ?? .text
        self.ownerUid = dict[.ownerUid] as? String ?? ""
        let timeInterval = dict[.timeStampt] as? TimeInterval ?? 0
        self.timeStampt = Date(timeIntervalSince1970: timeInterval)
        self.thumbnailUrl = dict[.thumbnailUrl] as? String ?? ""
    }
}

extension String {
    static let `type` = "type"
    static let timeStampt = "timeStampt"
    static let ownerUid = "ownerUid"
    static let text = "text"
    static let thumbnailWidth = "thumbnailWidth"
    static let thumbnailHeight = "thumbnailHeight"
}
