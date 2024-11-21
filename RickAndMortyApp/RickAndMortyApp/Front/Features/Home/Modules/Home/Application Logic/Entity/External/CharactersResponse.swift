//
//  CharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 26/06/24.
//

import Foundation


// MARK: - CharactersResponse

struct CharactersResponse: Codable {
    let info: InfoResponse
    let results: [CharacterResultResponse]
}
