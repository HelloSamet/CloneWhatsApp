//
//  SignupScreen.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 28.12.2024.
//

import SwiftUI

struct SignupScreen: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authScreenModel: AuthScreenModel
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: $authScreenModel.email)
            
            let userNameInputType = AuthTextField.InputType.custom("Username", "at")
            
            AuthTextField(type: userNameInputType, text: $authScreenModel.username)
            
            AuthTextField(type: .password, text: $authScreenModel.password)
            
            AuthButton(title: "Create an Account", onTap: {
                
            })
            .disabled(authScreenModel.disableSignUpButton)
            
            Spacer()
            
            backButton()
                .padding(.bottom, 30)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(colors: [Color.green, Color.green.opacity(0.5), Color.teal], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
    }
    
    private func backButton() -> some View{
        Button{
            dismiss()
        } label: {
            HStack{
                Image(systemName: "sparkles")
                
                (
                    Text("Already created an account ")
                    +
                    Text("Log in").bold()
                )
                
                Image(systemName: "sparkles")
            }.foregroundStyle(Color.white)
        }
    }
}

#Preview {
    SignupScreen(authScreenModel: AuthScreenModel())
}
