//
//  PasswordView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

struct PasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var avm: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Choose a Password")
                .fredokaFont(size: 22, font: .medium)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            
            CustomTextField(title: "Password", example: "", text: $avm.password, security: true)
            CustomTextField(title: "Confirm Password", example: "", text: $avm.confirmpassword, security: true)
                .padding(.bottom, 10)
            
            VStack {
                HStack(spacing: 0) {
                    Button {
                        avm.isCheckbox.toggle()
                    } label: {
                        Image(systemName: avm.isCheckbox ? "square.fill" : "square")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                    Text(" I ")
                    NavigationLink {
                        PDFKitView()
                    } label: {
                        Text("have made myself acquainted with")
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                }
                HStack(spacing: 0){
                    NavigationLink {
                        PDFKitView()
                    } label: {
                        Text("the Rules ")
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                    
                    Text("and accept all its provisions")
                }
            }.fredokaFont(size: 17)
                .padding(.bottom)
            
            MainButtonView(text: "Sign up") {
                avm.checkEmptySignup(screen: 2)
                if !avm.isEmpty && avm.checkPassword() {
                    //
                }

                
            }.padding(.vertical)
                .padding(.top)
            
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
            
            Spacer(minLength: 180)
        }
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
    PasswordView(avm: AuthViewModel())
}
