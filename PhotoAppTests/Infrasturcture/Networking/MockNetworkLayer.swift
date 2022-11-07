//
//  MockNetworkLayer.swift
//  PhotoAppTests
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation
@testable import PhotoApp

final class MockNetworkLayer: NetworkManager {
    
    let jsonDecoder = JSONDecoder()
    
    func request<E>(_ request: E, completion: @escaping (Result<E.Response, NetworkError>) -> Void) where E : EndpointProvider {
        var error: Error? = NetworkError.somethingUnexpected
        var data: Data? = nil
        if request is DummyPhotosEndpointProvider {
            if let url = Bundle(for: type(of: self)).url(forResource: "photolist", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
                data = jsonData
                error = nil
            }
        } else if request is DummyPhotoByIdEndpointProvider {
            if let url = Bundle(for: type(of: self)).url(forResource: "photo_by_id", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
                data = jsonData
                error = nil
            }
        }
        
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
}
