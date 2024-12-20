//
//  HomeHomeInteractor.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class HomeInteractor {
    
    weak var output: HomeInteractorOutput!
    lazy var homeClient: HomeClientProvider = HomeClient()
}


// MARK: HomeInteractorInput

extension HomeInteractor: HomeInteractorInput {
    
    func getCharacters() {
        homeClient.getCharacters { response in
            
            switch response {
                
            case .success(let success):
                
                self.output.didGetCharacters(success)
                
                // TODO: Validar todos los posibles errores
            case .failure( _):
                self.output.didFailGettingCharacters()
            }
        }
    }
}
