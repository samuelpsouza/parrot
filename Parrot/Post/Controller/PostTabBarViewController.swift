//
//  PostTabBarViewController.swift
//  parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit

class PostTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postController = StoryboardScene.Posts.postsViewController.instantiate()
        postController.tabBarItem.image = Asset.tabBarHouse.image
        self.viewControllers = [postController]

    }
}
