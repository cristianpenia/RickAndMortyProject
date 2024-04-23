//
//  LoginPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class LoginPresenter: LoginModuleInput{

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
}

extension LoginPresenter: LoginViewOutput {
    
    func viewIsReady() {
    }
    
    func didTapInformationButton() {
        
    }
    
    func didTapSendButton() {
        interactor.login()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func didLogin() {
        router.routeToHome()
    }
    
    func didFailLogin() {
    }
}
