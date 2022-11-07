//
//  DefaultDependencies.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

final class DefaultDependencies: AllDependencies {
    
    // MARK: - HasNetworkService Implementation
    let baseURL = BaseURL(scheme: "https", host: "jsonplaceholder.typicode.com")
    let networkManager: NetworkManager = DefaultNetworkManager(sessionManager: SessionManagerStore())
}
