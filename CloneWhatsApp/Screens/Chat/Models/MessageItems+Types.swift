//
//  MessageItems+Types.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 2.01.2025.
//

import Foundation

enum AdminMessageType: String {
    case channelCreation
    case memberAdded
    case memberLeft
    case channelNameChanged
}

enum MessageType {
    case text, photo, video, audio
}

enum MessageDirection {
    case sent, recived
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .recived].randomElement() ?? .sent
    }
}
