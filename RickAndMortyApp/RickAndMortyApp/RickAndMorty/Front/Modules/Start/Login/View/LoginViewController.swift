//
//  LoginRickAndMortyAppLoginViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, LoginViewInput {

    var output: LoginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
}
