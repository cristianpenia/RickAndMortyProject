//
//  LoginViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit
import RickAndMortyUI

class LoginViewController: BaseViewController {
    
    
    // MARK: Views
    
    @IBOutlet weak var informationButton: UIButton! {
        didSet {
            informationButton.tintColor = .green
        }
    }
    
    @IBOutlet weak var appImageView: UIImageView! {
        didSet {
            appImageView.image = Media.Image.rickAndMorty
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.placeholder = "Usuario" // TODO: In a next PR, chain management will be added
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = "Usuario" // TODO: In a next PR, chain management will be added
        }
    }
    
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.setTitle("Iniciar sesión", for: .normal) // TODO: In a next PR, chain management will be added
        }
    }
    
    
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
    
    func showLoading() {
        showViewLoading()
    }
    
    func hideLoading() {
        hideViewLoading()
    }
}
