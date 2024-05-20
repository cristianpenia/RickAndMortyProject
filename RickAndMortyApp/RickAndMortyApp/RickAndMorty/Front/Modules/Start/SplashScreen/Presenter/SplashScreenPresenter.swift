//
//  SplashScreenSplashScreenPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class SplashScreenPresenter: SplashScreenModuleInput, SplashScreenViewOutput, SplashScreenInteractorOutput {

    weak var view: SplashScreenViewInput!
    var interactor: SplashScreenInteractorInput!
    var router: SplashScreenRouterInput!

    func viewIsReady() {

    }
}
