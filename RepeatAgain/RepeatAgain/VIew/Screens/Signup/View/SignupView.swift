//
//  SignupView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var avm = AuthViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Create an Account")
                .fredokaFont(size: 22, font: .medium)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            
            CustomTextField(title: "First Name", example: "Your First Name", text: $avm.firstName)
            CustomTextField(title: "Last Name", example: "Your Last Name", text: $avm.lastName)
            CustomTextField(title: "Email Address", example: "Email", text: $avm.email)
                .padding(.bottom, 10)
            
            MainButtonView(text: "Continue") {
                avm.checkEmptySignup(screen: 1)
                if !avm.isEmpty && EmailModel.emailValidate(avm.email) {
                    avm.isContinue = true
                }
                
            }.padding(.vertical)
            
            HStack(spacing: 0){
                Text("Already you member? ")
                    .fredokaFont(size: 17)
                NavigationLink {
                    Login()
                } label: {
                    Text("Login")
                        .fredokaFont(size: 17, font: .medium)
                        .foregroundStyle(.hex5B7BFE)
                }
                
            }
            
            Spacer(minLength: 170)
        }.navigationDestination(isPresented: $avm.isContinue, destination: {
            PasswordView(avm: avm)
        })
        .alert("Empty Field", isPresented: $avm.isEmpty, actions: {
            Button {
                //
            } label: {
                Text("Ok")
            }

        })
        .header(text: "Signup") {
            dismiss()
        }
    }
}

#Preview {
    NavigationStack {
        SignupView()
    }
}
