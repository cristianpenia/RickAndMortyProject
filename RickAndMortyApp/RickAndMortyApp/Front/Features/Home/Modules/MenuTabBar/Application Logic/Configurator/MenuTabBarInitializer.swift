//
//  MenuTabBarMenuTabBarInitializer.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class MenuTabBarModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var menutabbarViewController: MenuTabBarViewController!

    override func awakeFromNib() {

        let configurator = MenuTabBarModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: menutabbarViewController)
    }

}
