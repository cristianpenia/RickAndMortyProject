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
    
    var cancellables: Set<AnyCancellable> = []
}


// MARK: HomeInteractorInput

extension HomeInteractor: HomeInteractorInput {
    
    func getCharacters() {
        
        //        let charactersURL = URL(string: "https://rickandmortyapi.com/api/character")!
        //
        //        AF.request(charactersURL)
        //            .responseDecodable(of: CharactersResponse.self) { response in
        //                switch response.result {
        //                case .success(let characters):
        //                    self.output.didGetCharacters(characters)
        //                case .failure(let error):
        //                    self.output.didFailGettingCharacters()
        //                }
        //            }
        
        
        //        NetworkManager.fetchCharacters { result in
        //            switch result {
        //            case .success(let characters):
        //                // Maneja el éxito
        //                print("Got characters: \(characters)")
        //            case .failure(let error):
        //                // Maneja el error
        //                print("Failed to get characters: \(error)")
        //            }
        //        }
        
        
//        homeClient.getCharacters()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] completion in
//                
//                switch completion {
//                    
//                case .failure(let networkingError as NetworkError):
//                    
//                    switch networkingError {
//                        // TODO: ver errores en cases
//                    case .authenticationFailed:
//                        self?.output.didFailGettingCharacters()
//                        
//                    default:
//                        self?.output.didFailGettingCharacters()
//                        
//                    }
//                    
//                default:
//                    break
//                }
//                
//            }, receiveValue: { [weak self] characters in
//                
//                self?.output.didGetCharacters(characters)
//                
//            }).store(in: &cancellables)
        
        homeClient.getCharacters { response in
            
            switch response {
                
            case .success(let success):
                
                self.output.didGetCharacters(success)
                
                // TODO: Validar todos los posibles errores
            case .failure(let failure):
                self.output.didFailGettingCharacters()
            }
        }
    }
}
