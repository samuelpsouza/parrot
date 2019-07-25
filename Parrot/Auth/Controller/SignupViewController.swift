//
//  SignupViewController.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var signupButton: UIButton!
   
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var service: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AuthService.init(delegate: self)
        self.labelTitle.text = L10n.Signup.Main.title
        self.signupButton.layer.cornerRadius = 5
    }

    @IBAction func signup(_ sender: Any) {
        if let email = self.usernameTextField.text,
            let password = self.passwordTextField.text,
            let fullName = self.fullNameTextField.text,
            let username = self.usernameTextField.text,
            !email.isEmpty && !password.isEmpty && !fullName.isEmpty && !username.isEmpty {
            
                self.service.postSignup(email: email, username: username, name: fullName, password: password)
        }
    }
}

extension SignupViewController: AuthServiceDelegate {
    func success() {
        ScreenManager.setupInitialViewController()
    }
    
    func failure(error: String) {
        print(error)
    }
}
