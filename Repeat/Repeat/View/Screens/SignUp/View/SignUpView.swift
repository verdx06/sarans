//
//  SignUpView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var avm = AuthViewModel()
    
    @State var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Create_an_Account")
                    .fredokaFont(size: 22, font: .medium)
                
                //textfields
                
                MainTextField(title: "First Name", example: "Your First Name", text: $avm.firstname)
                MainTextField(title: "Last Name", example: "Your Last Name", text: $avm.lastname)
                MainTextField(title: "Email Address", example: "Email", text: $avm.email)
                
                MainButtonView(text: "Continue") {
                    if !avm.email.isEmpty && !avm.firstname.isEmpty && !avm.lastname.isEmpty && EmailValidate.emailValidateRegex(email: avm.email) {
                        avm.isContinue = true
                    }
                }.padding(.top, 30)
                    .padding(.bottom)
                
                HStack(spacing: 0) {
                    Text("Already you member? ")
                        .foregroundStyle(.hex656872)
                        .fredokaFont(size: 17)
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Login")
                            .fredokaFont(size: 17, font: .medium)
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                }
                Spacer(minLength: 170)
                
            }.header(text: "Signup") {
                dismiss()
            }
            .navigationDestination(isPresented: $avm.isContinue) {
                PasswordView(avm: avm)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
