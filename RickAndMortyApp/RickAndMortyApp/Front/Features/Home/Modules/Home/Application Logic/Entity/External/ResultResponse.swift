//
//  ResultResponse.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 26/06/24.
//

import Foundation


// MARK: - ResultResponse

struct ResultResponse: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: LocationResponse
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
