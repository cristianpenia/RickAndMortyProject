//
//  LoginViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    
    // MARK: Views
    
    @IBOutlet weak var informationButton: UIButton!
    
    @IBOutlet weak var appImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    // MARK: Properties
    
    var output: LoginViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Actions
    
    @IBAction func informationButtonAction(_ sender: Any) {
        output.didTapInformationButton()
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        output.didTapSendButton()
    }
}


// MARK: LoginViewInput

extension LoginViewController: LoginViewInput {
    
    func setupInitialState() {
    }
}
