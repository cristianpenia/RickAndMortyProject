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
    
    lazy var appDelegate: AppDelegate? = UIApplication.shared.appDelegate
    lazy var window: UIWindow? = appDelegate?.window
    
    func routeToHome() {
        
//        let storyboard = UIStoryboard(name: Storyboards.Home.rawValue, bundle: nil)
//        
//        if let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.name) as? HomeViewController, let window {
//            
//            let configurator = HomeModuleConfigurator()
//            
//            configurator.configure(viewController: homeViewController)
//            
////            appDelegate?.window?.rootViewController = HomeViewController
//            
////            appDelegate?.window?.makeKeyAndVisible()
//            
//            window.rootViewController = nil
//            window.rootViewController?.navigationController?.viewControllers.removeAll()
//            window.rootViewController = homeViewController
//            
//            window.makeKeyAndVisible()
//        }
        if let rootViewController = viewController.navigationController?.viewControllers.first {
            replaceRoot(withIdentifier: "HomeViewController",
                        type: HomeViewController.self,
                        in: .home,
                        from: rootViewController,
                        previousViewControllers: [rootViewController],
                        moduleConfiguration: { _ in} )
        }
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
