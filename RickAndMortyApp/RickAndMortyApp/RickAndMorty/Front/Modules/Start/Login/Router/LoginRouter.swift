//
//  LoginRouter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterInput {
    
    func routeToHome() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let storyboard = UIStoryboard(name: Storyboards.Home.rawValue, bundle: nil)
        
        if let HomeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.name) as? HomeViewController {
            
            let configurator = HomeModuleConfigurator()
            
            configurator.configure(viewController: HomeViewController)
            
            appDelegate?.window?.rootViewController = HomeViewController
            
            appDelegate?.window?.makeKeyAndVisible()
        }
    }
}
