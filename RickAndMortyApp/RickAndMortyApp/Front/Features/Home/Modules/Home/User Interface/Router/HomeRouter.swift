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
        
//        present(withIdentifier: CharacterDetailsViewController.name,
//                type: CharacterDetailsViewController.self,
//                in: .home,
//                from: viewController,
//                presentationMode: .overCurrentContext) { characterDetailsViewController in
//
//            let moduleOutput = viewController?.output as? CharacterDetailsModuleOutput
//
//            characterDetailsViewController.modalTransitionStyle = .crossDissolve
//            characterDetailsViewController.moduleInput().initializeModule(moduleOutput: moduleOutput)
//        }
        
        
//        pushViewController(withIdentifer: CharacterDetailsViewController.name,
//                           type: CharacterDetailsViewController.self,
//                           in: .home,
//                           from: viewController) { controller in
//            
//            controller.moduleInput().initializeModule(character: character)
//        }
        
        presentPanModalController(withIdentifer: CharacterDetailsViewController.name,
                                    type: CharacterDetailsViewController.self,
                                    in: .home,
                                    from: viewController) { characterDetailsViewController in
            
            characterDetailsViewController.moduleInput().initializeModule(character: character)
        }
    }
}
