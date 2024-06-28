//
//  InfoResponse.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 26/06/24.
//

import Foundation


// MARK: - Info

struct InfoResponse: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}
