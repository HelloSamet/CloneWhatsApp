//
//  BubbleTailView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct BubbleTailView: View {
    var direction: MessageDirection
    private var backgroundColor: Color {
        return direction == .recived ? .bubbleWhite : .bubbleGreen
    }
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y: 3)
            .foregroundStyle(backgroundColor)
    }
}

#Preview {
    ScrollView{
        BubbleTailView(direction: .sent)
        BubbleTailView(direction: .recived)
    }.frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
}
