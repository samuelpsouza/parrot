//
//  PostService.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol PostServiceDelegate {
    func success()
    func failure(error: String)
}

class PostService {
    let delegate: PostServiceDelegate!
    
    init(delegate: PostServiceDelegate) {
        self.delegate = delegate
    }
    
    func getPosts(page: Int) {
        PostRequestFactory.getPosts(page: page).validate()
            .responseArray { (response: DataResponse<[Post]>) in
                switch response.result {
                case .success:
                    if let posts = response.result.value {
                        print(posts)
                        PostViewModel.save(object: posts)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    
    }
    
    func postPost(post: Post) {
        PostRequestFactory.postPost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        print(post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func putPost(post: Post) {
        PostRequestFactory.putPost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        print(post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
    
    func deletePost(post: Post) {
        PostRequestFactory.deletePost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        print(post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
}
