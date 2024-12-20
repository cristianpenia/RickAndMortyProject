//
//  HomeHomePresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import Foundation

class HomePresenter {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
}


// MARK: HomeModuleInput

extension HomePresenter: HomeModuleInput {
    
}


// MARK: HomeViewOutput

extension HomePresenter: HomeViewOutput {
    
    func viewIsReady() {
        self.view.showLoading()
        interactor.getCharacters()
    }
    
    func didTapCharacterCell(character: CharacterResultResponse) {
        router.routeToCharacterDetailsView(character: character)
    }
}


// MARK: HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
    @MainActor 
    func didGetCharacters(_ characters: CharactersResponse) {
        let charactersArray = characters.results
        
        self.view.hideLoading()
        
        if charactersArray.isEmpty {
            // TODO: sistema de alerts
        } else {
            self.view.setupInitialState(with: characters.results)
        }
    }
    
    func didFailGettingCharacters() {
        
        // TODO: sistema de alerts
        self.view.hideLoading()
        
    }
}

// capas de viper
// identacion,
// estandar de espaciado entre clases
// del viewcontroller sacar los @IBAction en una extension 
// revisar  en el uso de las clases deinit()
// template uso de self, en variables locales
// ejemplo de simplificacion snapkit
// forma de crear estructura de carpetas en el template en el template
// agregar el template de startmodule el router
// implementar el @MainActor
// revisar los paquetes compartidos por Charly 


