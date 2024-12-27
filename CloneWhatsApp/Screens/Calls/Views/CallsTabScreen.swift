//
//  CallsTabScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText: String = ""
    @State private var callHistory: CallHistory = .all
    var body: some View {
        NavigationStack{
            List{
                
                Section {
                    CreateCallLinkSection()
                }
                
                Section{
                    ForEach(0..<12) { _ in
                        RecentCallItemView()
                    }
                } header: {
                    Text("Recent")
                        .textCase(nil)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color.whatsAppBlack)
                }
            }.navigationTitle("Calls")
                .searchable(text: $searchText)
                .toolbar {
                    leadingNavItem()
                    trailingNavItem()
                    principalNavItem()
                }
        }
    }
}

extension CallsTabScreen {
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
                
            }, label: {
                Image(systemName: "phone.arrow.up.right")
            })
        }
    }
    
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit") {
                
            }
        }
    }
    
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("", selection: $callHistory) {
                ForEach(CallHistory.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150)
        }
    }
    
    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
       }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .foregroundStyle(Color.blue)
            
            VStack(alignment: .leading){
                Text("Create Call Link")
                    .foregroundStyle(Color.blue)
                
                Text("Share a link for you WhatsApp call")
                    .foregroundStyle(Color.gray)
                    .font(.caption)
            }
        }
    }
}

private struct RecentCallItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 45, height: 45)
            
            recentCallsTextView()
            
            Spacer()
            
            Text("Yesterday")
                .foregroundStyle(Color.gray)
                .font(.system(size: 16))
            
            Image(systemName: "info.circle")
            
        }
    }
    
    private func recentCallsTextView() -> some View {
        VStack(alignment: .leading){
            Text("John Smith")
            
            HStack(spacing: 5){
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
            }.font(.system(size: 14))
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    CallsTabScreen()
}
