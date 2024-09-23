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
            informationButton.tintColor = Color.green
        }
    }
    
    @IBOutlet weak var appImageView: UIImageView! {
        didSet {
            appImageView.image = Media.Image.rickAndMortyClean
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.placeholder = "Usuario" // TODO: In a next PR, chain management will be added
        }
    }
    
    var userTextField: TextField!
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = "Usuario" // TODO: In a next PR, chain management will be added
        }
    }
    
    @IBOutlet weak var sendButton: SecondaryUIButton! {
        didSet {
            sendButton.setTitle("Iniciar sesión", for: .normal)
        }
    }
    
    
    // MARK: Properties
    
    var output: LoginViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTest()
        
        output.viewIsReady()
    }
    
    
    // MARK: Private methods
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        
        appImageView.layer.cornerRadius = appImageView.frame.height / 3
        appImageView.clipsToBounds = true
        
    }
    
    
    
    private func setupTest() {
        
//        userTextField.placeholder = "Correo electrónico"
//        userTextField.errorMessage = "Ingresa un correo electrónico válido."
//        userTextField.validationPattern = .none
//        userTextField.validationPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
//        userTextField.keyboardType = .emailAddress
//        userTextField.autocapitalizationType = .none
        
        // Forma I
        let userTextFieldConfiguration = TextFieldConfiguration(placeholder: "Hola")
        
        // Forma II
//        var userTextFieldConfiguration = TextFieldConfiguration()
//
//        userTextFieldConfiguration.placeholder = "Correo electrónico"
//        userTextFieldConfiguration.errorMessage = "Ingresa un correo electrónico válido."
//        userTextFieldConfiguration.validationPattern = .none
//        userTextFieldConfiguration.validationPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
//        userTextFieldConfiguration.keyboardType = .emailAddress
//        userTextFieldConfiguration.autocapitalizationType = .none
        
        userTextField = TextField(frame: CGRect(), configuration: userTextFieldConfiguration)
        
        view.addSubview(userTextField)
        
        userTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func informationButtonAction(_ sender: Any) {
        output.didTapInformationButton()
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        dump(userTextField.text)
//        output.didTapSendButton()
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
    
    func showTooltip() {
        let tooltip = TooltipView(text: "This is a tooltip message.\nTest two")
        tooltip.show(at: CGPoint(x: view.center.x, y: view.center.y - 220), in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            tooltip.hide()
        }
    }
}
