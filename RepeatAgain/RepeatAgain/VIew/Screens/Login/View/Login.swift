//
//  Login.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct Login: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var avm = AuthViewModel()
    
    var body: some View {
        VStack {
            Image("loginlogo")
                .padding(.top)
            Text("For free, join now and\nstart learning")
                .fredokaFont(size: 22, font: .medium)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            
            CustomTextField(title: "Email Address", example: "Email", text: $avm.email)
            CustomTextField(title: "Password", example: "", text: $avm.password, security: true)
            HStack {
                Text("Forgot Password")
                    .fredokaFont(size: 15)
                    .foregroundStyle(.hexD6185D)
                Spacer()
            }.padding(.horizontal, 45)
                .padding(.vertical)
            
            MainButtonView(text: "Login") {
                avm.checkEmptyLogin()
                //
            }.padding(.vertical)
            
            HStack(spacing: 0){
                Text("Not you member? ")
                    .fredokaFont(size: 17)
                NavigationLink {
                    SignupView()
                } label: {
                    Text("Signup")
                        .fredokaFont(size: 17, font: .medium)
                        .foregroundStyle(.hex5B7BFE)
                }
                
            }
            
            Spacer()
        }.alert("Empty Field", isPresented: $avm.isEmpty, actions: {
            Button {
                //
            } label: {
                Text("Ok")
            }

        })
        .header(text: "Login") {
            dismiss()
        }
    }
}

#Preview {
    NavigationStack {
        Login()
    }
}
