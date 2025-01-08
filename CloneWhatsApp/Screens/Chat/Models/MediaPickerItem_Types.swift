//
//  MediaPickerItem_Types.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 5.01.2025.
//

import Foundation
import SwiftUI

struct VideoPickerTransferable: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation{
        FileRepresentation(contentType: .movie, exporting: { exportingFile in
            return .init(exportingFile.url)
        }, importing: { receivedTransferredFile in
            let orginalfile = receivedTransferredFile.file
            let uniqueFileName = "\(UUID().uuidString).mov"
            let copiedFile = URL.documentsDirectory.appendingPathComponent(uniqueFileName)
            try FileManager.default.copyItem(at: orginalfile, to: copiedFile)
            return .init(url: copiedFile)
        })
    }
    
}

struct MediaAttachment: Identifiable {
    let id: String
    let type: MediaAttachmentType
    
    var thumbnail: UIImage {
        switch type {
        case .photo(let thumbnail):
            return thumbnail
        case .video(let thumbnail, let _2):
            return thumbnail
        case .audio:
            return UIImage()
        }
    }
    
    var fileURL: URL? {
        switch type {
        case .photo:
            return nil
        case .video(let _, let fileURL):
            return fileURL
        case .audio(let voiceURL, _):
            return voiceURL
        }
    }
}

enum MediaAttachmentType: Equatable {
    case photo(_ thumbnail: UIImage)
    case video(_ thumbnail: UIImage, _ url: URL)
    case audio(_ url: URL, _ duration: TimeInterval)
    
    static func == (lhs: MediaAttachmentType, rhs: MediaAttachmentType) -> Bool {
        switch(lhs, rhs) {
        case (.photo, .photo), (.video, .video), (.audio, .audio):
            return true
        default:
            return false
        }
    }
}
