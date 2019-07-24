//
//  UserViewModel.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import RealmSwift

class UserViewModel {
    static func save(object: User) {
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func delete() {
        if let result = uiRealm.objects(User.self).first {
            try? uiRealm.write {
                uiRealm.delete(result)
            }
        }
    }
}
