//
//  StoreStoreConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class StoreModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? StoreViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: StoreViewController) {

        let router = StoreRouter()

        let presenter = StorePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = StoreInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
