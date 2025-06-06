//
//  CharaptersListConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 21/01/2025.
//  Copyright © 2025 RickAndMortyApp. All rights reserved.
//

class CharaptersListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? CharaptersListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CharaptersListViewController) {

        let router = CharaptersListRouter()

        let presenter = CharaptersListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharaptersListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
