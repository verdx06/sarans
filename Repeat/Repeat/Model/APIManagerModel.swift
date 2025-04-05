//
//  APIManagerModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import Foundation
import Alamofire

class APIManagerModel {
    
    static let instance = APIManagerModel()
    
    let rest_api = "https://volantreaction-us.backendless.app/api/users/"
    let api_register = "register"
    let login = "login"
    
    func signup(firstname: String, lastname: String, email: String, password: String, complition: @escaping (Bool) -> ()) {
        
        let params: Parameters = [
            "firstname" : firstname,
            "lastname" : lastname,
            "name" : firstname+" "+lastname,
            "email" : email,
            "password" : password
        ]
        
        
        AF.request(rest_api + api_register, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers()).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                if response.response?.statusCode == 200 {
                    complition(true)
                }
            case .failure(let error):
                complition(false)
            }
        }
        
    }
    
    func signin(email: String, password: String, complition: @escaping (Bool) -> ()) {
        
        let params: Parameters = [
            "login" : email,
            "password" : password
        ]
        
        AF.request(rest_api+login, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers()).validate().responseJSON { response in
            switch response.result {
            case .success(let data) :
                if response.response?.statusCode == 200 {
                    complition(true)
                }
                print(data)
            case .failure(let error) :
                print(error.localizedDescription)
                complition(false)
            }
        }
        
    }
    
    func headers() -> HTTPHeaders {
        return [
            .contentType("application/json"),
            .authorization(bearerToken: "72036410-3C04-4FF9-86CA-63CB19D83499")
        ]
    }
    
}
