//
//  CharaptersListViewInput.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 21/01/2025.
//  Copyright © 2025 RickAndMortyApp. All rights reserved.
//

protocol CharaptersListViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> CharaptersListModuleInput
}
