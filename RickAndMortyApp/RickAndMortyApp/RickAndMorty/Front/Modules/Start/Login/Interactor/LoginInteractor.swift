//
//  LoginInteractor.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput!

    func login() {
        
        // TODO: The connection will be worked on in a next PR
        output.didLogin()
    }
}
