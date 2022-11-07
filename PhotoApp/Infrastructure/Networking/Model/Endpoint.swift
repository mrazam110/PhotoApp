//
//  Endpoint.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

public struct BaseURL {
    let scheme: String
    let host: String
    let port: Int?

    public init(scheme: String, host: String, port: Int? = nil) {
        self.scheme = scheme
        self.host = host
        self.port = port
    }
}

public struct API {
    let baseURL: BaseURL
    let path: [String]
    
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = baseURL.scheme
        components.host = baseURL.host
        components.port = baseURL.port
        components.path = "/" + (path).joined(separator: "/")
        
        return components.url!
    }
}

enum HTTPMethod: String {
    case get = "GET"
}

struct Endpoint {
    let method: HTTPMethod
    let api: API
    
    func urlRequest() -> Result<URLRequest, NetworkError> {
        let request = URLRequest(url: api.url)
        // There will be a use of Network Error if we have implemented POST request to show encoding error or network request failure error generation
        return .success(request)
    }
}
