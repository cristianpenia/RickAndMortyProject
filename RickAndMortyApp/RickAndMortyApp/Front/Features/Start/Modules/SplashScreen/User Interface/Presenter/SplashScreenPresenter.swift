//
//  SplashScreenSplashScreenPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import Foundation

class SplashScreenPresenter {

    weak var view: SplashScreenViewInput!
    var interactor: SplashScreenInteractorInput!
    var router: SplashScreenRouterInput!
}


// MARK: SplashScreenModuleInput

extension SplashScreenPresenter: SplashScreenModuleInput {
    
}


// MARK: SplashScreenViewOutput

extension SplashScreenPresenter: SplashScreenViewOutput {
    
    func viewIsReady() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.router.routeToLogin()
        }
    }
}


// MARK: SplashScreenInteractorOutput

extension SplashScreenPresenter: SplashScreenInteractorOutput {
    
}
