//
//  LoginPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class LoginPresenter {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
}


// MARK: LoginModuleInput

extension LoginPresenter: LoginModuleInput {
    
}


// MARK: LoginViewOutput

extension LoginPresenter: LoginViewOutput {
    
    func viewIsReady() {}
    
    func didTapInformationButton() {
        view.showTooltip()
    }
    
    func didTapSendButton() {
        view.showLoading()
        interactor.login()
    }
}


// MARK: LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {
    
    func didLogin() {
        
        // TODO: The connection will be worked on in a next PR
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.view.hideLoading()
            self.router.routeToHome()
        }
    }
    
    func didFailLogin() {}
}
