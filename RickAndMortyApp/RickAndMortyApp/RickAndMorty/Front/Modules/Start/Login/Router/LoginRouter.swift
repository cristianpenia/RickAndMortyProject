//
//  LoginRouter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterInput, Routable {
    
    weak var viewController: LoginViewController!
    
    func routeToHome() {
        
        if let rootViewController = viewController.navigationController?.viewControllers.first {
            
//            replaceRoot(withIdentifier: HomeViewController.name,
//                        type: HomeViewController.self,
//                        in: .home,
//                        from: rootViewController,
//                        previousViewControllers: [],
//                        moduleConfiguration: { _ in} )
            replaceRoot(withIdentifier: MenuTabBarViewController.name,
                        type: MenuTabBarViewController.self,
                        in: .home,
                        from: rootViewController,
                        previousViewControllers: [],
                        moduleConfiguration: { _ in} )
        }
    }
}
