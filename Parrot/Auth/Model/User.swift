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
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    @objc dynamic var username: String?
    @objc dynamic var picture: String?
    @objc dynamic var token: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id.value   <- map["id"]
        self.name       <- map["nome"]
        self.email      <- map["email"]
        self.username   <- map["username"]
        self.picture    <- map["foto"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
