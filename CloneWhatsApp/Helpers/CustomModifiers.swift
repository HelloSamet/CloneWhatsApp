//
//  CustomModifiers.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import Foundation
import SwiftUI

private struct BubbleTailModifier: ViewModifier {
    var direction: MessageDirection
    
    func body(content: Content) -> some View {
        content.overlay(alignment: direction == .recived ? .bottomLeading : .bottomTrailing) {
            BubbleTailView(direction: direction)
        }
    }
}

extension View {
    func applyTail(_ direction: MessageDirection) -> some View {
        self.modifier(BubbleTailModifier(direction: direction))
    }
}
