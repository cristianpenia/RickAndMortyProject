//
//  ServiceCoordinator.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 24/04/24.
//

import Foundation


// MARK: Error Handling

enum NetworkError: Error {
    case connectivityIssue
    case serverError(statusCode: Int)
    case authenticationFailed
    case invalidResponse
    case dataLoadingError(description: String)
}


// MARK: Protocol for Decodable Responses

protocol DecodableResponse {
    associatedtype ModelType: Decodable
    static func decode(data: Data) throws -> ModelType
}


// MARK: Header Provider

struct HeaderProvider {
    func defaultHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    func authenticatedHeaders(token: String) -> [String: String] {
        var headers = defaultHeaders()
        headers["Authorization"] = "Bearer \(token)"
        return headers
    }
}


// MARK: Service Coordinator

class ServiceCoordinator {
    
    static let shared = ServiceCoordinator()
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20.0
        session = URLSession(configuration: config)
    }
    
    func request<T: DecodableResponse>(
        _ type: T.Type, // Agregado para facilitar la inferencia del tipo
        url: URL,
        method: String = "GET",
        headers: [String: String] = [:],
        body: Data? = nil,
        completion: @escaping (Result<T.ModelType, NetworkError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(.connectivityIssue))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                    return
                }
                guard let data = data else {
                    completion(.failure(.dataLoadingError(description: "No data received")))
                    return
                }

                do {
                    let model = try T.decode(data: data)  // Using T here
                    completion(.success(model))
                } catch {
                    completion(.failure(.dataLoadingError(description: "Failed to decode data")))
                }
            }
        }
        task.resume()
    }

}


struct User: Decodable {
    var name: String
    var email: String
}

struct UserResponse: DecodableResponse {
    typealias ModelType = User

    static func decode(data: Data) throws -> User {
        return try JSONDecoder().decode(User.self, from: data)
    }
}

class Test {
    func test() {
        let url = URL(string: "https://api.example.com/user")!
        ServiceCoordinator.shared.request(UserResponse.self, url: url, method: "GET", headers: HeaderProvider().defaultHeaders()) { (result: Result<User, NetworkError>) in
            switch result {
            case .success(let user):
                print("User Name: \(user.name)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}




