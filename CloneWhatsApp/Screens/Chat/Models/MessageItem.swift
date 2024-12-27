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
    let direction: MessageDirection
    
    static let sentPlaceHolder = MessageItem(text: "Holy Spagetti", direction: .sent)
    static let recivedPlaceHolder = MessageItem(text: "Hey Dude whats up", direction: .recived)
    
    var alignment: Alignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .recived ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
}

enum MessageDirection {
    case sent, recived
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .recived].randomElement() ?? .sent
    }
}
