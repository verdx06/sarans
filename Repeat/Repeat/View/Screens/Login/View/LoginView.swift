//
//  LoginView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var avm = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("loginimage")
            
            Text("For free, join now and\nstart learning")
                .fredokaFont(size: 22, font: .medium)
                .multilineTextAlignment(.center)
            
            MainTextField(title: "Email Address", example: "Email", text: $avm.email)
            MainTextField(title: "Password", example: "", text: $avm.password, security: true)
            
            HStack {
                Button {
                    //
                } label: {
                    Text("Forgot Password")
                        .fredokaFont(size: 15)
                        .foregroundStyle(.hexD6185D)
                }.padding(.top, 10)
                Spacer()
            }.padding(.horizontal, 45)

            
            MainButtonView(isProgress: avm.isProgress, text: "Login") {
                if EmailValidate.emailValidateRegex(email: avm.email) {
                    avm.signin()
                }
            }.padding(.top, 30)
                .padding(.bottom)
            
            HStack(spacing: 0) {
                Text("Not you member? ")
                    .foregroundStyle(.hex656872)
                    .fredokaFont(size: 17)
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Signup")
                        .fredokaFont(size: 17, font: .medium)
                        .foregroundStyle(Color.hex5B7BFE)
                }
            }
            
            
            
            Spacer(minLength: 150)
            
        }.header(text: "Signup") {
            dismiss()
        }
    }
}
#Preview {
    NavigationStack {
        LoginView()
    }
}
