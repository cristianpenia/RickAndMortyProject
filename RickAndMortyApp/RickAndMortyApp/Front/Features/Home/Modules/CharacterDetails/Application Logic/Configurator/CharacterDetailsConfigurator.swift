//
//  CharacterDetailsConfigurator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import Foundation

class CharacterDetailsModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {
        
        if let viewController = viewInput as? CharacterDetailsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: CharacterDetailsViewController) {
        
        let router = CharacterDetailsRouter()
        
        router.viewController = viewController
        
        let presenter = CharacterDetailsPresenter()
        
        presenter.view = viewController
        presenter.router = router
        
        let interactor = CharacterDetailsInteractor()
        
        interactor.output = presenter
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
