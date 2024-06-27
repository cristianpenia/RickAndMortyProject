//
//  MenuTabBarMenuTabBarPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class MenuTabBarPresenter: MenuTabBarModuleInput, MenuTabBarViewOutput, MenuTabBarInteractorOutput {

    weak var view: MenuTabBarViewInput!
    var interactor: MenuTabBarInteractorInput!
    var router: MenuTabBarRouterInput!

    func viewIsReady() {

    }
}
