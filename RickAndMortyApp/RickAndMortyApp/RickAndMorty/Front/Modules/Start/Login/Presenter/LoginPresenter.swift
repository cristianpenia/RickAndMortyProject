//
//  LoginPresenter.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

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
        
        view.showLoading()
        interactor.login()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func didLogin() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.view.hideLoading()
            self.router.routeToHome()
        }
    }
    
    func didFailLogin() {
    }
}
