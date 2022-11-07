//
//  Network.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

protocol NetworkManager {
    func request<E: EndpointProvider>(_ request: E, completion: @escaping (Result<E.Response, NetworkError>) -> Void)
}

final class DefaultNetworkManager: NetworkManager {
    private let sessionManager: SessionManager
    private let jsonDecoder = JSONDecoder()
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func request<E>(_ request: E, completion: @escaping (Result<E.Response, NetworkError>) -> Void) where E : EndpointProvider {
        
        let request = request.endpoint
        let session = sessionManager.sessionManager(for: request.api.baseURL)
        
        guard case let .success(urlRequest) = request.urlRequest() else {
            if case let .failure(error) = request.urlRequest() {
                completion(.failure(.encodingError(error)))
            }
            return
        }
        
        print(urlRequest)
        
        let task = session.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(.server(data, error)))
            } else if let data = data {
                do {
                    let response = try self.jsonDecoder.decode(E.Response.self, from: data)
                    completion(.success(response))
                } catch let err {
                    completion(.failure(.decoding(data, err)))
                }
            } else {
                completion(.failure(.somethingUnexpected))
            }
        }
        
        task.resume()
    }
}
