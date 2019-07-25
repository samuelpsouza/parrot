//
//  ScreenManager.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import Foundation
import UIKit

class ScreenManager {
    static func setupInitialViewController() {
        if SessionControl.isSessionActive {
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: StoryboardScene.Posts.postTabBarViewController.instantiate())
        } else {
            UIApplication.shared.keyWindow?.rootViewController = StoryboardScene.Main.viewController.instantiate()
        }
    }
}
