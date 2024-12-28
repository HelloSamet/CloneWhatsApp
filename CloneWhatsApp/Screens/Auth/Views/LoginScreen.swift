//
//  LoginScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 28.12.2024.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                AuthHeaderView()
                AuthTextField(type: .email, text: .constant(""))
                AuthTextField(type: .password, text: .constant(""))
                
                forgotPasswordButton()
                
                AuthButton(title: "Log in now", onTap: {
                    
                })
                
                Spacer()
                
                signUpButton()
                    .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.teal.gradient)
            .ignoresSafeArea()
        }
    }
    
    private func forgotPasswordButton() -> some View {
        Button(action: {
            
        }, label: {
            Text("Forgot Password ?")
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 32)
                .bold()
                .padding(.vertical)
        })
    }
    
    private func signUpButton() -> some View{
        NavigationLink{
            Text("SIGN UP View PLACEHOLDER")
        } label: {
            HStack{
                Image(systemName: "sparkles")
                
                (
                    Text("Don't have an account ? ")
                    +
                    Text("Create one").bold()
                )
                
                Image(systemName: "sparkles")
            }
        }
    }
}

#Preview {
    LoginScreen()
}
