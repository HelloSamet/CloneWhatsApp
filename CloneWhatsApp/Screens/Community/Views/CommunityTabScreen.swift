//
//  CommunityTabScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 27.12.2024.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    
                    Image(.communities)
                    
                    Group {
                        
                        Text("Stay connected with a community").font(.title2)
                        
                        Text("Communities bring members together in topic-based groups. Any community you're added to will appear here")
                            .foregroundStyle(Color.gray)
                        
                    }
                    .padding(.horizontal, 5)
                    
                    Button("See example communities >"){ }
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    createNewCommunityButton()
                }
                .padding()
                .navigationTitle("Communities")
            }
        }
    }
    
    private func createNewCommunityButton() -> some View {
        Button(action: {
            
        }, label: {
            Label("New Community", systemImage: "plus")
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(Color.white)
                .padding(10)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
        })
    }
}

#Preview {
    CommunityTabScreen()
}
