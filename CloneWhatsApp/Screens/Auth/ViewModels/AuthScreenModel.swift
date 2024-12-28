//
//  AuthScreenModel.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 28.12.2024.
//

import Foundation

final class AuthScreenModel: ObservableObject {
    
    // MARK: Published Properties
    
    @Published var isLoading = false
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    // MARK: Computed Properties
    
    var disableLoginButton: Bool {
        return email.isEmpty || password.isEmpty || isLoading
    }
    
    var disableSignUpButton: Bool {
        return email.isEmpty || password.isEmpty || username.isEmpty || isLoading
    }
}
