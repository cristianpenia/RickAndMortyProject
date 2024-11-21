//
//  CharacterDetailsModuleInput.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import Foundation
 
protocol CharacterDetailsModuleInput: AnyObject {
    
    func initializeModule(character: CharacterResultResponse)
}
