//
//  CharacterDetailsPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import Foundation

class CharacterDetailsPresenter {
    
    weak var view: CharacterDetailsViewInput!
    var interactor: CharacterDetailsInteractorInput!
    var router: CharacterDetailsRouterInput!
    
    var character: CharacterResultResponse!
}


// MARK: CharacterDetailsModuleInput

extension CharacterDetailsPresenter: CharacterDetailsModuleInput {
    
    func initializeModule(character: CharacterResultResponse) {
        self.character = character
    }
}


// MARK: CharacterDetailsViewOutput

extension CharacterDetailsPresenter: CharacterDetailsViewOutput {
    
    func viewIsReady() {
        view.setUpInitialState(character: character)
    }
}


// MARK: CharacterDetailsInteractorOutput

extension CharacterDetailsPresenter: CharacterDetailsInteractorOutput {}
