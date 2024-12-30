//
//  UserItem.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 29.12.2024.
//

import Foundation

struct UserItem: Identifiable, Hashable, Decodable {
    let uid: String
    let username: String
    let email: String
    var bio: String? = nil
    var profileImageUrl: String? = nil
    
    var id: String {
        return uid
    }
    
    var bioUnwrapped: String {
        return bio ?? "Hey there! I am using WhatsApp."
    }
    
    static let placeholder = UserItem(uid: "1", username: "Osas", email: "hellosamet@gmail.com")
    
    static let placeholders: [UserItem] = [
            UserItem(uid: "1", username: "Osas", email: "hellosamet@gmail.com", bio: "iOS Developer based in Istanbul."),
            UserItem(uid: "2", username: "John", email: "john.doe@gmail.com", bio: "Avid traveler and tech enthusiast."),
            UserItem(uid: "3", username: "Jane", email: "jane.smith@gmail.com"),
            UserItem(uid: "4", username: "Alice", email: "alice.wonderland@gmail.com", bio: "Loves exploring new places."),
            UserItem(uid: "5", username: "Bob", email: "bob.builder@gmail.com", bio: "Building dreams one line of code at a time."),
            UserItem(uid: "6", username: "Charlie", email: "charlie.brown@gmail.com"),
            UserItem(uid: "7", username: "Diana", email: "diana.queen@gmail.com", bio: "Coffee lover and bookworm."),
            UserItem(uid: "8", username: "Eve", email: "eve.adams@gmail.com"),
            UserItem(uid: "9", username: "Frank", email: "frank.castle@gmail.com", bio: "Fitness enthusiast and gamer."),
            UserItem(uid: "10", username: "Grace", email: "grace.hopper@gmail.com", bio: "Passionate about innovation and design."),
            UserItem(uid: "11", username: "Henry", email: "henry.ford@gmail.com", bio: "Driving change with technology."),
            UserItem(uid: "12", username: "Isabella", email: "isabella.artist@gmail.com", bio: "Inspired by colors and nature."),
            UserItem(uid: "13", username: "Jack", email: "jack.sparrow@gmail.com", bio: "Exploring the seven seas."),
            UserItem(uid: "14", username: "Karen", email: "karen.manager@gmail.com"),
            UserItem(uid: "15", username: "Leo", email: "leo.coder@gmail.com", bio: "Coding my way to success."),
            UserItem(uid: "16", username: "Mia", email: "mia.designer@gmail.com", bio: "Designing the future."),
            UserItem(uid: "17", username: "Nathan", email: "nathan.baker@gmail.com", bio: "Baking happiness into every day."),
            UserItem(uid: "18", username: "Olivia", email: "olivia.writer@gmail.com", bio: "Words are my superpower."),
            UserItem(uid: "19", username: "Paul", email: "paul.traveler@gmail.com"),
            UserItem(uid: "20", username: "Quinn", email: "quinn.creator@gmail.com", bio: "Creating magic with code.")
        ]
}

extension UserItem {
    init(dictionary: [String: Any]) {
        self.uid = dictionary[.uid] as? String ?? ""
        self.username = dictionary[.username] as? String ?? ""
        self.email = dictionary[.email] as? String ?? ""
        self.bio = dictionary[.bio] as? String? ?? nil
        self.profileImageUrl = dictionary[.profileImageUrl] as? String? ?? nil
    }
}

extension String {
    static let uid = "uid"
    static let username = "username"
    static let email = "email"
    static let bio = "bio"
    static let profileImageUrl = "profileImageUrl"
}
