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
                                             completion: @escaping (Result<T, Error>) -> Void,
                                             file: String = #file,
                                             function: String = #function) {
        
        switch response.result {
            
        case .success(let data):
            
            guard let data = data else {
                LogManager.log("No data received", from: file, and: function)
                
                completion(.failure(NSError(domain: "",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            // Imprime el JSON en formato legible
            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
               let prettyPrintedData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
               let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                
                LogManager.log("JSON Response:\n\(prettyPrintedString)", from: file, and: function)
            } else {
                LogManager.log("Failed to convert data to JSON", type: .network)
            }
            
            // Decodifica el JSON en el tipo esperado
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                
                completion(.success(decodedResponse))
            } catch {
                LogManager.log("Failed to decode \(T.self): \(error)", type: .network)
                
                completion(.failure(error))
            }
            
        case .failure(let error):
            LogManager.log("Error: \(error)", type: .network)
            completion(.failure(error))
        }
    }
}
