//
//  SplashScreenSplashScreenConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class SplashScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SplashScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SplashScreenViewController) {

        let router = SplashScreenRouter()

        let presenter = SplashScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SplashScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
