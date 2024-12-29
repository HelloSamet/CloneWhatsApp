//
//  FirebaseConstants.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 29.12.2024.
//

import Foundation
import Firebase
import FirebaseStorage

enum FirebaseConstants {
    private static let DatabaseRef = Database.database().reference()
    static let UserRef = DatabaseRef.child("users")
}
