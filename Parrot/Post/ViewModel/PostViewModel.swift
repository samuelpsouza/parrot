//
//  PostViewModel.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import RealmSwift

class PostViewModel {
    static func save(object: [Post]) {
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
}
