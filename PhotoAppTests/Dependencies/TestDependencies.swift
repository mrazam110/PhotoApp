//
//  TestDependencies.swift
//  PhotoAppTests
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation
@testable import PhotoApp

final class TestDependencies: AllDependencies {
    var baseURL = BaseURL(scheme: "https", host: "mock.com")
    let networkManager: NetworkManager = MockNetworkLayer()
}
