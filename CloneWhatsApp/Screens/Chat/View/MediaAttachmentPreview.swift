//
//  MediaAttachmentPreview.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 5.01.2025.
//

import SwiftUI

struct MediaAttachmentPreview: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                audioAttachmentPreview()
                ForEach(0..<12) { _ in
                    thumbnailImageView()
                }
            }
        }
        .frame(height: Constants.listHeight)
        .frame(maxWidth: .infinity)
        .background(Color.whatsAppWhite)
    }
    
    private func thumbnailImageView() -> some View {
        Button(action: {
            
        }, label: {
            Image(.stubImage0)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.imageDimen, height: Constants.imageDimen)
                .cornerRadius(5)
                .clipped()
                .overlay(alignment: .topTrailing) {
                    cancelButton()
                }
                .overlay {
                    playButton("play.fill")
                }
        })
    }
    
    private func cancelButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "xmark")
                .scaledToFit()
                .imageScale(.small)
                .padding(5)
                .foregroundStyle(Color.white)
                .background(Color.white.opacity(0.5))
                .clipShape(Circle())
                .shadow(radius: 5)
                .padding(2)
                .bold()
        })
    }
    
    private func playButton(_ systemName: String) -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: systemName)
                .scaledToFit()
                .imageScale(.large)
                .padding(10)
                .foregroundStyle(Color.white)
                .background(Color.white.opacity(0.5))
                .clipShape(Circle())
                .shadow(radius: 5)
                .padding(2)
                .bold()
        })
    }
    
    private func audioAttachmentPreview() -> some View {
        ZStack{
            LinearGradient(colors: [Color.green, Color.green.opacity(0.8), Color.teal], startPoint: .topLeading, endPoint: .bottom)
            playButton("mic.fill")
                .padding(.bottom, 15)
        }
        .frame(width: Constants.imageDimen * 2, height: Constants.imageDimen)
        .cornerRadius(5)
        .clipped()
        .overlay(alignment: .topTrailing, content: {
            cancelButton()
        })
        .overlay(alignment: .bottomLeading, content: {
            Text("Test mp3 file name here")
                .lineLimit(1)
                .font(.caption)
                .padding(2)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(Color.white)
                .background(Color.white.opacity(0.5))
            
        })
    }
    
}

extension MediaAttachmentPreview {
    enum Constants {
        static let listHeight: CGFloat = 100
        static let imageDimen: CGFloat = 80
    }
}

#Preview {
    MediaAttachmentPreview()
}
