//
//  StoreStorePresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class StorePresenter: StoreModuleInput, StoreViewOutput, StoreInteractorOutput {

    weak var view: StoreViewInput!
    var interactor: StoreInteractorInput!
    var router: StoreRouterInput!

    func viewIsReady() {

    }
}
