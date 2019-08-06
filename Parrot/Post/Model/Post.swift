//
//  Post.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Post: Object, Mappable {
    var id = RealmOptional<Int>()
    @objc dynamic var message: String?
    @objc dynamic var author: String?
    var likes = RealmOptional<Int>()
    var liked = RealmOptional<Bool>()
    @objc dynamic var postAuthor: Author?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id.value       <- map["id"]
        self.message        <- map["mensagem"]
        self.author         <- map["postagem"]
        self.likes.value    <- map["qtd_curtidas"]
        self.liked.value    <- map["curtido"]
        self.postAuthor     <- map["autor"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
