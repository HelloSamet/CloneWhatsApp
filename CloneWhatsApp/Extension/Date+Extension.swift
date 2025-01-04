//
//  Date+Extension.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 4.01.2025.
//

import Foundation

extension Date {
    
    var dayOrTimeRepresentation: String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        if calendar.isDateInToday(self) {
            dateFormatter.dateFormat = "h:mm a"
            let formattedDate = dateFormatter.string(from: self)
            return formattedDate
            
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            dateFormatter.dateFormat = "MM/dd/yy"
            return dateFormatter.string(from: self)
        }
    }
    
    var formatToTime: String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "h:mm a"
        let formattedTime = dateformatter.string(from: self)
        return formattedTime
    }
}
