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
        view.showLoading()
        interactor.getCharacters()
    }
}


// MARK: HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
    func didGetCharacters(_ characters: CharactersResponse) {
        let charactersArray = characters.results
        
        view.hideLoading()
        
        if charactersArray.isEmpty {
            // TODO: sistema de alerts
        } else {
            view.setupInitialState(with: characters.results)
        }
    }
    
    func didFailGettingCharacters() {
        // TODO: sistema de alerts
        view.hideLoading()
    }
}
