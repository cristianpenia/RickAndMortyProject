//
//  CharaptersListInitializer.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 21/01/2025.
//  Copyright © 2025 RickAndMortyApp. All rights reserved.
//

import Foundation

class CharaptersListModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var charaptersListViewController: CharaptersListViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = CharaptersListModuleConfigurator()
        configurator.configureModuleForViewInput(charaptersListViewController)
    }
}
