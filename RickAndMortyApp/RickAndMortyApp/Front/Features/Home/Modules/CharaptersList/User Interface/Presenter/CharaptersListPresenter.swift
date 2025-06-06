//
//  CharaptersListPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 21/01/2025.
//  Copyright © 2025 RickAndMortyApp. All rights reserved.
//

class CharaptersListPresenter {

    weak var view: CharaptersListViewInput!
    var interactor: CharaptersListInteractorInput!
    var router: CharaptersListRouterInput!
}


// MARK: CharaptersListModuleInput methods

extension CharaptersListPresenter: CharaptersListModuleInput {

    func initializeModule() {
    }
}


// MARK: CharaptersListViewOutput methods

extension CharaptersListPresenter: CharaptersListViewOutput {

    func viewIsReady() {
    }
}


// MARK: CharaptersListInteractorOutput methods

extension CharaptersListPresenter: CharaptersListInteractorOutput {
}
