//
//  AppDelegate.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    // MARK: Properties
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Start", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            
            let configurator = LoginModuleConfigurator()
            
            configurator.configure(viewController: loginViewController)
            
            self.window?.rootViewController = loginViewController
            
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

