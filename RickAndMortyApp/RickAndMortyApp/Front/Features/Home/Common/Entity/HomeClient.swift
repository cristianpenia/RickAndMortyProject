//
//  HomeClient.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 27/06/24.
//

import Foundation
import Combine
import Alamofire

protocol HomeClientProvider {
    func getCharacters(completion: @escaping (Result<CharactersResponse, Error>) -> Void)
}

final class HomeClient: HomeClientProvider {
    
    func getCharacters(completion: @escaping (Result<CharactersResponse, any Error>) -> Void) {
        // TODO: Generar una extension de alamofire para que acepte este sipo de elementos y no tengamos que hacer todo esto
        AF.request(HomeResources.characters.resource.route)
            .response { response in
            NetworkManager.handleResponse(response,
                                          of: CharactersResponse.self,
                                          completion: completion)
        }
    }
}
