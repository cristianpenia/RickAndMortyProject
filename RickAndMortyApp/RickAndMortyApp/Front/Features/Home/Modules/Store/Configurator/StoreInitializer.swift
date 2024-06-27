//
//  StoreStoreInitializer.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class StoreModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var storeViewController: StoreViewController!

    override func awakeFromNib() {

        let configurator = StoreModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: storeViewController)
    }

}
