//
//  UpdatesTabScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 26.12.2024.
//

import SwiftUI

struct UpdatesTabScreen: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack{
            List{
                StatusSectionHeader()
                    .listRowBackground(Color.clear)
                
                StatusSection()
                
                Section {
                    RecentUpdatesItemView()
                } header: {
                    Text("Recent Updates")
                }
                
                Section{
                    ChannelListView()
                } header: {
                    channelSectionHeader()
                }
                
                
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
        }
    }
    
    private func channelSectionHeader() -> some View {
        HStack{
            Text("Channels")
                .bold()
                .font(.title3)
                .textCase(nil)
                .foregroundStyle(.whatsAppBlack)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .padding(7)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            })
            
        }
    }
}

extension UpdatesTabScreen {
    enum Constant{
        static let imageDimen: CGFloat = 55
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "circle.dashed")
                .foregroundColor(Color.blue)
                .imageScale(.large)
            
            (
                Text("Use Status to share photos, text and videos that disappear in 24 hours.")
                +
                Text(" ")
                +
                Text("Status Privacy")
                    .foregroundColor(Color.blue).bold()
            )
            
            Image(systemName: "xmark")
                .foregroundColor(Color.gray)
        }.padding()
            .background(Color.whatsAppWhite)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen, height: UpdatesTabScreen.Constant.imageDimen)
            
            VStack(alignment: .leading){
                Text("My Status")
                    .font(.callout)
                    .bold()
                
                Text("Add to my status")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            cameraButton()
            pencilButton()
        }
    }
    
    private func cameraButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        })
    }
    
    private func pencilButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        })
    }
}

private struct RecentUpdatesItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen, height: UpdatesTabScreen.Constant.imageDimen)
            
            VStack(alignment: .leading){
                Text("Joseph Smith")
                    .font(.callout)
                    .bold()
                
                Text("1h ago")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 15))
            }
        }
    }
}

private struct ChannelListView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Stay updated on topics that matter to you. Find channels to fallow below.")
                .foregroundStyle(Color.gray)
                .font(.callout)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5) { _ in
                        SuggestedChannelItemView()
                    }
                }
            }
            
            Button("Explore more") { }
                .tint(Color.blue)
                .bold()
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding()
        }
    }
}

private struct SuggestedChannelItemView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen, height: UpdatesTabScreen.Constant.imageDimen)
            
            Text("Real Madrid C.F")
            
            Button(action: {
                
            }, label: {
                Text("Fallow")
                    .bold()
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Capsule())
            })
        }.padding(.horizontal, 16)
            .padding(.vertical)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
    }
}

#Preview {
    UpdatesTabScreen()
}
