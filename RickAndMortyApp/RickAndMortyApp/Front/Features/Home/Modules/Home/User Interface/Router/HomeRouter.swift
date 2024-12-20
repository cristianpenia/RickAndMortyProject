//
//  HomeHomeRouter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class HomeRouter: Routable {
    
    weak var viewController: HomeViewController!
    
}

extension HomeRouter: HomeRouterInput {
    
    func routeToCharacterDetailsView(character: CharacterResultResponse) {
        
        presentPanModalController(withIdentifer: CharacterDetailsViewController.storyboardIdentifier,
                                  type: CharacterDetailsViewController.self,
                                  in: .home,
                                  from: viewController) { characterDetailsViewController in
            
            characterDetailsViewController.moduleInput().initializeModule(character: character)
        }
    }
}
