//
//  ViewController.swift
//  parrot
//
//  Created by administrador on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImageView.image = Asset.logo.image
    }

    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBAction func signupButton(_ sender: Any) {
    }
}

