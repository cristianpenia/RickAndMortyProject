//
//  CharacterDetailsInitializer..swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import Foundation

class CharacterDetailsModuleInitializer: NSObject {

    @IBOutlet weak var characterDetailsViewController: CharacterDetailsViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = CharacterDetailsModuleConfigurator()
        
        configurator.configureModuleForViewInput(characterDetailsViewController)
    }
}
