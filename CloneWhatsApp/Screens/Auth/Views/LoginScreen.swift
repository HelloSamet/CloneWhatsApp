//
//  LoginScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 28.12.2024.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var authScreenModel = AuthScreenModel()
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                AuthHeaderView()
                AuthTextField(type: .email, text: $authScreenModel.email)
                AuthTextField(type: .password, text: $authScreenModel.password)
                
                forgotPasswordButton()
                
                AuthButton(title: "Log in now", onTap: {
                    
                }).disabled(authScreenModel.disableLoginButton)
                
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
            SignupScreen(authScreenModel: authScreenModel)
        } label: {
            HStack{
                Image(systemName: "sparkles")
                
                (
                    Text("Don't have an account ? ")
                    +
                    Text("Create one").bold()
                )
                
                Image(systemName: "sparkles")
            }.foregroundStyle(Color.white)
        }
    }
}

#Preview {
    LoginScreen()
}
