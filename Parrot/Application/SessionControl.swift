//
//  SessionControl.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation

class SessionControl {
    static var headers: [String : String] = [:]
    
    static var user: User? {
        return uiRealm.objects(User.self).first
    }
    
    static var isSessionActive: Bool {
        if self.user != nil {
            return true
        }
        return false
    }
    
    static func setHeaders() {
        if let user = self.user {
            if let token = user.token {
                self.headers["Access-Token"] = token
            }
        }
    }
}
