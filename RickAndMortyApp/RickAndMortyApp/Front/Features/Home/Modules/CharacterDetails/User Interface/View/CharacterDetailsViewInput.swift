//
//  CharacterDetailsViewInput.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import Foundation

protocol CharacterDetailsViewInput: AnyObject {
    
    func setUpInitialState(character: CharacterResultResponse)
    func moduleInput() -> CharacterDetailsModuleInput
}
