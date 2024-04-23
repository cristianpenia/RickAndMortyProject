//
//  RickAndMortyAppLoginRickAndMortyAppLoginConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    func configure(viewController: LoginViewController) {

        let router = LoginRouter()

        let presenter = LoginPresenter()
        
        presenter.view = viewController
        presenter.router = router

        let interactor = LoginInteractor()
        
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
