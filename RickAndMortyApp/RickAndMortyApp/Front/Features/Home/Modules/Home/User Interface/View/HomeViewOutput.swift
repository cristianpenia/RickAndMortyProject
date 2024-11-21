//
//  HomeHomeViewOutput.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

protocol HomeViewOutput {
    
    func viewIsReady()
    func didTapCharacterCell(character: CharacterResultResponse)
}
