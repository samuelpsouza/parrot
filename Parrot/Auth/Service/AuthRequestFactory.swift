//
//  AuthRequestFactory.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import Alamofire

class AuthRequestFactory {
    
    static func postLogin(email: String, password: String) -> DataRequest {
        let credentials = [
            "email": email,
            "password": password
        ]
        
        return Alamofire.request(BASE_URL + "/usuario/login",
                                 method: .post, parameters: credentials, encoding: JSONEncoding.default)
    }
    
    static func postSignup(email: String, username: String, name: String, password: String) -> DataRequest {
        let userForm = [
            "nome": name,
            "username": username,
            "email": email,
            "password": password
        ]
        
        return Alamofire.request(BASE_URL + "/usuario", method: .post, parameters: userForm, encoding: JSONEncoding.default)
    }
}
