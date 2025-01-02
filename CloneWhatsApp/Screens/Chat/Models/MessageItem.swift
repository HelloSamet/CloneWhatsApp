//
//  MessageItem.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import Foundation
import SwiftUI

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let type: MessageType
    let direction: MessageDirection
    
    static let sentPlaceHolder = MessageItem(text: "Holy Spagetti", type: .text, direction: .sent)
    static let recivedPlaceHolder = MessageItem(text: "Hey Dude whats up", type: .text, direction: .recived)
    
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
        MessageItem(text: "Hi there", type: .text, direction: .sent),
        MessageItem(text: "Check out this photo", type: .photo, direction: .recived),
        MessageItem(text: "Play out this video", type: .video, direction: .sent),
        MessageItem(text: "", type: .audio, direction: .recived)
    ]
}

extension String {
    static let `type` = "type"
    static let timeStampt = "timeStampt"
    static let ownerUid = "ownerUid"
}
