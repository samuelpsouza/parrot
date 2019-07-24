//
//  User.swift
//  parrot
//
//  Created by administrador on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class User: Object, Mappable {
    var id = RealmOptional<Int>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id.value   <- map["id"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
