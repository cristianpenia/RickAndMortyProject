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
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        
//        let storyboard = UIStoryboard(name: Storyboards.Home.rawValue, bundle: nil)
//        
//        if let HomeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.name) as? HomeViewController {
//            
//            let configurator = HomeModuleConfigurator()
//            
//            configurator.configure(viewController: HomeViewController)
//            
//            appDelegate?.window?.rootViewController = HomeViewController
//            
//            appDelegate?.window?.makeKeyAndVisible()
//        }
        
        option()
        
        
    }
    func option() {
//        let storyBoard = UIStoryboard.storyboard(.home, bundle: .main)
//        let homeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
////        let homeViewController = storyBoard.instantiateViewController(withIdentifier: HomeViewController.storyboardIdentifier)
//        let appDelegate: AppDelegate? = UIApplication.shared.appDelegate
//        
//        appDelegate?.window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        
    }
}
