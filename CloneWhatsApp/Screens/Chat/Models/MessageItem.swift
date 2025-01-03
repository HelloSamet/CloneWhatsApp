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
    let text: String
    let type: MessageType
    let ownerUid: String
    let timeStampt: Date
    
    var direction: MessageDirection {
        return ownerUid == Auth.auth().currentUser?.uid ? .sent : .recived
    }
    
    static let sentPlaceHolder = MessageItem(id: UUID().uuidString, text: "Holy Spagetti", type: .text, ownerUid: "1", timeStampt: Date())
    static let recivedPlaceHolder = MessageItem(id: UUID().uuidString, text: "Hey dude whats up", type: .text, ownerUid: "2", timeStampt: Date())
    
    var alignment: Alignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
    
    static let stubMessage: [MessageItem] = [
        MessageItem(id: UUID().uuidString, text: "Hi there", type: .text, ownerUid: "3", timeStampt: Date()),
        MessageItem(id: UUID().uuidString,text: "Check out this photo", type: .photo, ownerUid: "4", timeStampt: Date()),
        MessageItem(id: UUID().uuidString,text: "Play out this video", type: .video, ownerUid: "5", timeStampt: Date()),
        MessageItem(id: UUID().uuidString,text: "", type: .audio, ownerUid: "6", timeStampt: Date())
    ]
}

extension MessageItem {
    init(id: String, dict: [String: Any]){
        self.id = id
        self.text = dict[.text] as? String ?? ""
        let type = dict[.type] as? String ?? "text"
        self.type = MessageType(type) ?? .text
        self.ownerUid = dict[.ownerUid] as? String ?? ""
        let timeInterval = dict[.timeStampt] as? TimeInterval ?? 0
        self.timeStampt = Date(timeIntervalSince1970: timeInterval)
    }
}

extension String {
    static let `type` = "type"
    static let timeStampt = "timeStampt"
    static let ownerUid = "ownerUid"
    static let text = "text"
}
