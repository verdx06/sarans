//
//  AuthViewModel.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import Foundation
import Alamofire

class AuthViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmpassword: String = ""
    
    @Published var isEmpty: Bool = false
    @Published var isCheckbox: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isContinue: Bool = false
    
    func checkPassword() -> Bool {
        
        let same = password == confirmpassword
        let count = password.count >= 8
        let low = password.contains { $0.isLowercase }
        let up = password.contains { $0.isUppercase }
        let num = password.contains { $0.isNumber }
        let sym = password.rangeOfCharacter(from: .symbols) != nil || password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return same && count && low && up && num && sym
    }
    
    func checkEmptySignup(screen: Int) {
        if screen == 1 {
            isEmpty = firstName.isEmpty || lastName.isEmpty || email.isEmpty
        } else {
            isEmpty = password.isEmpty || confirmpassword.isEmpty
        }
    }
    
    func checkEmptyLogin() {
        isEmpty = email.isEmpty || password.isEmpty
    }
    
    func getImage() {
        
        let randomPage = Int.random(in: 1...1000)
        let url = "https://api.artic.edu/api/v1/artworks?limit=1&page=\(randomPage)&fields=image_id,title"
        
        AF.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                if let json = data as? [String : Any], let dataArray = json["data"] as? [[String : Any]], let data = dataArray.first, let image = data["image_id"] as? String {
                    if let config = json["config"] as? [String : Any], let baseURL = config["iiif_url"] as? String {
                        var url = baseURL+"/"+image+"/full/400,/0/default.jpg"
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
