//
//  EmailModel.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import Foundation

class EmailModel {
    private static let emailRegex = "[a-z0-9]+@[a-z0-9]+\\.[a-z]{2,64}"
    
    static func emailValidate(_ email: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
        
    }
    
}
