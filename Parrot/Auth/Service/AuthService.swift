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
        AuthRequestFactory.postLogin(email: email, password: password)
            .validate().responseObject { (response: DataResponse<User>) in
               self.doLogin(response: response)
        }
    }
    
    func postSignup(email: String, username: String, name: String, password: String){
        AuthRequestFactory.postSignup(email: email, username: username, name: name, password: password)
            .validate().responseObject { (response: DataResponse<User>) in
                self.doLogin(response: response)
        }
    }
    
    fileprivate func doLogin(response: DataResponse<User>) {
        switch response.result {
        case .success:
            if let user = response.result.value {
                if let token = response.response?.allHeaderFields["token"] as? String {
                    
                    user.token = token
                    UserViewModel.save(object: user)
                    
                    SessionControl.setHeaders()
                }
            }
            
            self.delegate.success()
        case .failure(let error):
            self.delegate.failure(error: error.localizedDescription)
        }
    }
}
