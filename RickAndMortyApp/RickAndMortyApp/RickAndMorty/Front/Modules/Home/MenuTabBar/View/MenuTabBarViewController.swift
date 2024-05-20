//
//  MenuTabBarMenuTabBarViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class MenuTabBarViewController: UITabBarController {
    
    
    // MARK: Views
    
    var homeViewController: HomeViewController! {
        didSet {
            homeViewController.title = "Home" // TODO: improve chain management in a following PR
            homeViewController.tabBarItem.image = UIImage(systemName: "house") // TODO: improve icon management in a following PR
        }
    }
    
    var storeViewController: StoreViewController! {
        didSet {
            storeViewController.title = "Store" // TODO: improve chain management in a following PR
            storeViewController.tabBarItem.image = UIImage(systemName: "storefront") // TODO: improve icon management in a following PR
        }
    }
    
    var profileViewController: ProfileViewController! {
        didSet {
            profileViewController.title = "Profile" // TODO: improve chain management in a following PR
            profileViewController.tabBarItem.image = UIImage(systemName: "person") // TODO: improve icon management in a following PR
        }
    }
    
    
    // MARK: Properties
    
    var output: MenuTabBarViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItems()
        output.viewIsReady()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Cuando se selecciona un elemento del tab bar, cargamos la vista correspondiente manualmente
        if let index = tabBar.items?.firstIndex(of: item) {
            let viewController = viewControllers?[index]
            viewController?.loadViewIfNeeded() // Cargamos la vista si aún no está cargada
        }
    }
    
    private func setupItems() {
        
        let storyboard = UIStoryboard(name: Storyboards.Home.rawValue, bundle: nil)
        
        if let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.name) as? HomeViewController,
           let storeViewController = storyboard.instantiateViewController(withIdentifier: StoreViewController.name) as? StoreViewController,
           let profileViewController = storyboard.instantiateViewController(withIdentifier: ProfileViewController.name) as? ProfileViewController {
            
            let homeconfigurator = HomeModuleConfigurator()
            
            homeconfigurator.configure(viewController: homeViewController)
            
            self.homeViewController = homeViewController
            
            let storeconfigurator = StoreModuleConfigurator()
            
            storeconfigurator.configure(viewController: storeViewController)
            
            self.storeViewController = storeViewController
            
            let profileconfigurator = ProfileModuleConfigurator()

            profileconfigurator.configure(viewController: profileViewController)
            
            self.profileViewController = profileViewController
            
            self.viewControllers = [homeViewController, storeViewController, profileViewController]
        }
    }
}


// MARK: MenuTabBarViewInput

extension MenuTabBarViewController: MenuTabBarViewInput {
    
    func setupInitialState() {
    }
}
