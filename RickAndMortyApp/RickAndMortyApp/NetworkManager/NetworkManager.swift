//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 27/06/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func handleResponse<T: Decodable>(_ response: AFDataResponse<Data?>, 
                                             of type: T.Type,
                                             completion: @escaping (Result<T, Error>) -> Void) {
        
        switch response.result {
            
        case .success(let data):
            
            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            // Imprime el JSON en formato legible
            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
               let prettyPrintedData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
               let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                print("JSON Response:\n\(prettyPrintedString)")
            } else {
                print("Failed to convert data to JSON")
            }
            
            // Decodifica el JSON en el tipo esperado
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                print("Failed to decode \(T.self): \(error)")
                completion(.failure(error))
            }
            
        case .failure(let error):
            print("Error: \(error)")
            completion(.failure(error))
        }
    }
    
    
    // TODO: remover esto
//    static func fetchCharacters(completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
//        let charactersURL = "https://api.example.com/characters" // Reemplaza con tu URL
//
//        AF.request(charactersURL).response { response in
//            handleResponse(response, of: CharactersResponse.self, completion: completion)
//        }
//    }
}
