//
//  AuthViewModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

class AuthViewModel: ObservableObject{
    
    @Published var firstname: String = "ee"
    @Published var lastname: String = "ee"
    @Published var email: String = "we@we.we"
    @Published var password: String = "12345678"
    @Published var confirmpassword: String = "12345678"
    @Published var isCheckbox: Bool = false
    
    @Published var isContinue: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    func signup() {
        isProgress = true
        
        APIManagerModel.instance.signup(firstname: firstname, lastname: lastname, email: email, password: password) { result in
            self.isProgress = false
            self.isNavigate = true
        }
    }
    
    func signin() {
        isProgress = true
        
        APIManagerModel.instance.signin(email: email, password: password) { result in
            self.isProgress = false
            self.isNavigate = true
        }
        
    }
    
    func checkpassword() -> Bool {
        let same = password == confirmpassword
        let low = password.contains { $0.isLowercase }
        let up = password.contains { $0.isUppercase }
        let num = password.contains { $0.isNumber }
        let count = password.count >= 8
        let symb = password.rangeOfCharacter(from: .symbols) != nil || password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return same && low && up && num && count && symb
    }
    
}


