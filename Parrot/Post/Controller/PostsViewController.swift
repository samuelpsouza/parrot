//
//  PostsViewController.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    var service: PostService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = PostService.init(delegate: self)
    }
}

extension PostsViewController: PostServiceDelegate {
    func success() {
        
    }
    
    func failure(error: String) {
        print(error)
    }
}
