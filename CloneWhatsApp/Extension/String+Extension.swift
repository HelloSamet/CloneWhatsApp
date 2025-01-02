//
//  String+Extension.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 2.01.2025.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool { return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}
