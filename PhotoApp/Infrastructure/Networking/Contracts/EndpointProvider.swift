//
//  EndpointProvider.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

typealias DTO = Codable

struct EmptyDTO: DTO {}

protocol EndpointProvider {
    associatedtype Response: DTO
    associatedtype Body: Encodable
    
    var endpoint: Endpoint { get }
}
