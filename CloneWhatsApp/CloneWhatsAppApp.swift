//
//  CloneWhatsAppApp.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 26.12.2024.
//

import SwiftUI
import SwiftData
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct CloneWhatsAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
    }
}

