//
//  HomeResources.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 27/06/24.
//

import Foundation
import Alamofire


enum HomeResources: Resource {
    
    
    case characters
    
    
//    var cryptableType: CryptableType {
//        .autenticated
//    }
    
    
    var resource: (method: HTTPMethod, route: String) {
        switch self {
            
        case .characters:
            return (.post, "https://rickandmortyapi.com/api/character")
        }
    }
}
