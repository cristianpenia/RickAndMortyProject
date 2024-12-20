//
//  SceneDelegate.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        
        // TODO: generar un main coordinator
        
        let storyboard = UIStoryboard(name: Storyboards.Start.rawValue, bundle: nil)
        
        if let splashScreenViewController = storyboard.instantiateViewController(withIdentifier: SplashScreenViewController.storyboardIdentifier) as? SplashScreenViewController {
            
            let configurator = SplashScreenModuleConfigurator()
            
            configurator.configure(viewController: splashScreenViewController)
            
            self.window?.rootViewController = UINavigationController(rootViewController: splashScreenViewController)
            
            self.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

