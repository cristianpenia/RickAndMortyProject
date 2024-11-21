//
//  LoginRouter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginRouter: Routable {
    
    weak var viewController: LoginViewController!
    
}

extension LoginRouter: LoginRouterInput {
    
    func routeToHome() {
        
        if let rootViewController = viewController.navigationController?.viewControllers.first {
            
            replaceRoot(withIdentifier: MenuTabBarViewController.name,
                        type: MenuTabBarViewController.self,
                        in: .home,
                        from: rootViewController,
                        previousViewControllers: [],
                        moduleConfiguration: { _ in} )
        }
    }
}
