//
//  MainTabView.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 26.12.2024.
//

import SwiftUI

struct MainTabView: View {
    init() {
        makeTabBarOpaque()
        let thumpImage = UIImage(systemName: "circle.fill")
        UISlider.appearance()
            .setThumbImage(thumpImage, for: .normal)
    }
    var body: some View {
        TabView {
            UpdatesTabScreen()
                .tabItem
            {
                Image(systemName: Tab.updates.icon)
                Text(Tab.updates.title)
            }
            CallsTabScreen()
                .tabItem
            {
                Image(systemName: Tab.calls.icon)
                Text(Tab.calls.title)
            }
            CommunityTabScreen()
                .tabItem
            {
                Image(systemName: Tab.communities.icon)
                Text(Tab.communities.title)
            }
            ChannelTabScreen()
                .tabItem
            {
                Image(systemName: Tab.chats.icon)
                Text(Tab.chats.title)
            }
            SettingsTabScreen()
                .tabItem
            {
                Image(systemName: Tab.settings.icon)
                Text(Tab.settings.title)
            }
        }
    }
    
    private func makeTabBarOpaque() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MainTabView()
}


extension MainTabView {
    
    private func placeholderItemView(_ title: String) -> some View {
        ScrollView{
            VStack{
                ForEach(0..<120) { _ in
                    Text(title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.green.opacity(0.5))
                }
            }
        }
    }
    
    private enum Tab: String {
        case updates, calls, communities, chats, settings
        
        fileprivate var title: String {
            return rawValue.capitalized
        }
        
        fileprivate var icon: String {
            switch self {
            case .updates:
                return "inset.filled.circle.dashed"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}
