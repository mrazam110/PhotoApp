//
//  DependenciesProtocol.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

protocol EmptyDependency {}

protocol AllDependencies: EmptyDependency, HasNetworkService {}

protocol HasNetworkService {
    var baseURL: BaseURL { get }
    var networkManager: NetworkManager { get }
}
