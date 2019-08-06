//
//  PostViewModel.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import RealmSwift

struct PostView {
    var id = 0
    var message = ""
    var author = ""
    var likes = 0
    var liked = false
    var postAuthor = AuthorView()
}

struct AuthorView {
    var id = 0
    var name = ""
    var username = ""
    var email = ""
    var picture = ""
}

class PostViewModel {
    static func save(object: [Post]) {
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func update(post: Post) {
        try? uiRealm.write {
            uiRealm.add(post, update: .modified)
        }
    }
    
    static func delete(post: Post) {
        uiRealm.delete(post)
    }
    
    fileprivate static func getAsView(post: Post?) -> PostView {
        
        guard let post = post else {
            return PostView()
        }
        
        var postView = PostView()
        postView.id = post.id.value ?? 0
        postView.message = post.message ?? ""
        postView.likes = post.likes.value ?? 0
        postView.liked = post.liked.value ?? false
        postView.postAuthor.id = post.postAuthor?.id.value ?? 0
        postView.postAuthor.name = post.postAuthor?.name ?? ""
        postView.postAuthor.email = post.postAuthor?.email ?? ""
        postView.postAuthor.picture = post.postAuthor?.picture ?? ""
        postView.postAuthor.username = post.postAuthor?.username ?? ""
        
        return postView
    }
    
    fileprivate static func getAsView(posts: [Post]) -> [PostView] {
        
        var postView: [PostView] = []
        
        posts.forEach { (post) in
            postView.append(self.getAsView(post: post))
        }
        
        return postView
    }
    
    fileprivate static func get() -> [Post] {
        let results = uiRealm.objects(Post.self)
        
        var posts: [Post] = []
        posts.append(contentsOf: results)
        
        return posts
    }
    
    static func getPosts() -> [PostView] {
        return self.getAsView(posts: self.get())
    }
    
    
    static func getAsModel(postView: PostView) -> Post {
        let post = Post()
        post.id.value = postView.id
        post.message = postView.message
        
        return post
    }
    
    static func deletePosts() {
        let results = uiRealm.objects(Post.self)
        
        try? uiRealm.write {
            uiRealm.delete(results)
        }
    }
}
