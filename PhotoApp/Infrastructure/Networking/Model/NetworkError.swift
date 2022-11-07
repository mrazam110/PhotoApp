//
//  NetworkError.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case decoding(Data?, Error)
    case encodingError(Error)
    case server(Data?, Error)
    case somethingUnexpected
    
    public var errorDescription: String? {
        switch self {
        case .decoding(_, let error):
            return error.localizedDescription
        case .encodingError(let error):
            return error.localizedDescription
        case .server(_, let error):
            return error.localizedDescription
        case .somethingUnexpected:
            return NSLocalizedString("Something unexpected happened", comment: "")
        }
    }
}
