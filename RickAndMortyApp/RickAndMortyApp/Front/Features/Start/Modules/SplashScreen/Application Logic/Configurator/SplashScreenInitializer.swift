//
//  SplashScreenSplashScreenInitializer.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class SplashScreenModuleInitializer: NSObject {
    
    @IBOutlet weak var splashscreenViewController: SplashScreenViewController!

    override func awakeFromNib() {

        let configurator = SplashScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashscreenViewController)
    }

}
