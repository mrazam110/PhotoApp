//
//  DummyPhotoByIdEndpoint.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

struct DummyPhotoByIdEndpointProvider: EndpointProvider {
    
    private let baseURL: BaseURL
    private let id: Int
    
    init(baseURL: BaseURL, id: Int) {
        self.baseURL = baseURL
        self.id = id
    }
    
    var endpoint: Endpoint {
        Endpoint(method: .get, api: API(baseURL: baseURL, path: ["photo", "\(id)"]))
    }
    
    typealias Response = DummyPhotoDTO
    typealias Body = EmptyDTO
}
