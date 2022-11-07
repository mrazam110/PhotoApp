//
//  DummyPhotoListEndpoint.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

struct DummyPhotosEndpointProvider: EndpointProvider {
    
    private let baseURL: BaseURL
    
    init(baseURL: BaseURL) {
        self.baseURL = baseURL
    }
    
    var endpoint: Endpoint {
        Endpoint(method: .get, api: API(baseURL: baseURL, path: ["photos"]))
    }
    
    typealias Response = [DummyPhotoDTO]
    typealias Body = EmptyDTO
}
