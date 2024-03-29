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
                        PostViewModel.save(object: posts)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    
    }
    
    func postPost(post: String) {
        PostRequestFactory.postPost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        PostViewModel.save(object: [post])
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
                        PostViewModel.update(post: post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
    
    func deletePost(post: PostView) {
        PostRequestFactory.deletePost(post: post.id).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        PostViewModel.delete(post: post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
    
    func postLike(post: PostView) {
        PostRequestFactory.postLike(post: post.id).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        PostViewModel.update(post: post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
    
    func deleteLike(post: PostView) {
        PostRequestFactory.deleteLike(post: post.id).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                case .success:
                    if let post = response.result.value {
                        PostViewModel.update(post: post)
                    }
                    
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
                }
        }
    }
}
