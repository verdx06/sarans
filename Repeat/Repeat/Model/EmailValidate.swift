//
//  EmailValidate.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 04.04.2025.
//

import Foundation

//Класс для валидации email
class EmailValidate {
    
    //Функция которая проверяет строчку email
    static func emailValidateRegex(email: String) -> Bool {
        let emailRegex = "[a-z0-9a-z.+-]+@[a-za-z]+\\.[a-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
    }
    
}
