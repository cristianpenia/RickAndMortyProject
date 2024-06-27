//
//  SplashScreenSplashScreenRouter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class SplashScreenRouter: SplashScreenRouterInput, Routable {
    
    weak var viewController: SplashScreenViewController!
    
    func routeToLogin() {
        
        if let rootViewController = viewController.navigationController?.viewControllers.first {
            
            replaceRoot(withIdentifier: LoginViewController.name,
                        type: LoginViewController.self,
                        in: .start,
                        from: rootViewController,
                        previousViewControllers: [],
                        moduleConfiguration: { _ in} )
        }
    }
}
