//
//  AuthService.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol AuthServiceDelegate {
    func success()
    func failure(error: String)
}

class AuthService {
    let delegate: AuthServiceDelegate!
    
    init(delegate: AuthServiceDelegate) {
        self.delegate = delegate
    }
    
    func postLogin(email: String, password: String) {
        
    }
    
    func postSignup(email: String, username: String, name: String, password: String){
        
    }
}
