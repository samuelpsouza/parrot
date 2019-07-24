//
//  ViewController.swift
//  parrot
//
//  Created by administrador on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var service: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AuthService.init(delegate: self)
        self.logoImageView.image = Asset.logo.image
        self.loginButton.layer.cornerRadius = 5
    }

    @IBAction func loginButton(_ sender: Any) {
        if let email = self.usernameTextField.text,
            let password = self.passwordTextField.text,
            !email.isEmpty && !password.isEmpty {
            self.service.postLogin(email: email, password: password)
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let controller = StoryboardScene.Main.signupViewController.instantiate()
        self.present(controller, animated: true)
    }
}

extension ViewController: AuthServiceDelegate {
    func success() {
        
    }
    
    func failure(error: String) {
        print(error)
    }
}
