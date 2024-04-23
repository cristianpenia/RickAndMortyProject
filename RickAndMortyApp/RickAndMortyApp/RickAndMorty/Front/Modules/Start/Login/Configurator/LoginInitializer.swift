//
//  LoginInitializer.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {
    
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {

        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
