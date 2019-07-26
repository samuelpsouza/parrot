//
//  PostRequestFactory.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import Alamofire

class PostRequestFactory {
    static func getPosts(page: Int) -> DataRequest {
        return Alamofire.request(BASE_URL + "/postagem?pagina=" + String(page),
                                 method: .get, headers: SessionControl.headers)
    }
    
    static func postPost(post: String) -> DataRequest {
        let postForm = [
            "mensagem": post
        ]
        
        return Alamofire.request(BASE_URL + "/postagem", method: .post, parameters: postForm, encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func putPost(post: Post) -> DataRequest {
        let id = String(post.id.value ?? 0)
        return Alamofire.request(BASE_URL + "/postagem/" + id, method: .put, parameters: post.toJSON(), encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func deletePost(post: Post) -> DataRequest {
        let id = String(post.id.value ?? 0)
        return Alamofire.request(BASE_URL + "/postagem/" + id, method: .delete, encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
}
