//
//  TimeInterval+Extension.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 8.01.2025.
//

import Foundation

extension TimeInterval {
    var formatElapsedtime: String {
        let minute = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
    
    static var stubTimeInterval: TimeInterval {
        return TimeInterval()
    }
}
