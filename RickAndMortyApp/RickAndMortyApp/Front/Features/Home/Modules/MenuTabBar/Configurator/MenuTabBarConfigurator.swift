//
//  MenuTabBarMenuTabBarConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class MenuTabBarModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MenuTabBarViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MenuTabBarViewController) {

        let router = MenuTabBarRouter()

        let presenter = MenuTabBarPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MenuTabBarInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
