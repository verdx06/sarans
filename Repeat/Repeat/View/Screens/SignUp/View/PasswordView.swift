//
//  PasswordView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct PasswordView: View {
    
    @ObservedObject var avm: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Text("Create_an_Account")
                .fredokaFont(size: 22, font: .medium)
            
            MainTextField(title: "Password", example: "", text: $avm.password, security: true)
            MainTextField(title: "Confirm Password", example: "", text: $avm.confirmpassword, security: true)
            
            VStack {
                HStack(spacing: 0) {
                    Button {
                        avm.isCheckbox.toggle()
                    } label: {
                        Image(systemName: avm.isCheckbox ? "square.fill" : "square")
                            .resizable()
                            .foregroundStyle(.hex5B7BFE)
                            .frame(width: 18, height: 18)
                    }
                    
                    Text(" I ")
                    NavigationLink {
                        PDFKitView()
                    } label: {
                        Text("have made myself acquainted with")
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                }
                HStack(spacing: 0) {
                    NavigationLink {
                        PDFKitView()
                    } label: {
                        Text("the Rules ")
                            .foregroundStyle(Color.hex5B7BFE)
                    }
                    Text("and accept all its provisions,")
                }
            }.fredokaFont(size: 17)
                .padding(.bottom, 30)
                .padding(.top)
            
            MainButtonView(isProgress: avm.isProgress, text: "Signup") {
                avm.signup()
            }.padding(.top, 30)
                .padding(.bottom)
            
            HStack(spacing: 0) {
                Text("Already you member? ")
                    .foregroundStyle(.hex656872)
                    .fredokaFont(size: 17)
                NavigationLink {
                    //
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
    }
}

#Preview {
    NavigationStack {
        PasswordView(avm: AuthViewModel())
    }
}
