//
//  NetworkError.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {

    case badURL
    case decodingError(Error)
    case requestFailed(Error)
    case invalidStatusCode(Int)
    case noData

    var errorDescription: String? {
        switch self {
        case .badURL:
            return String(localized: Strings.NetworkError.badURL)
            
        case .decodingError(let error):
            return String(localized: Strings.NetworkError.decodingError(error.localizedDescription))
            
        case .requestFailed(let error):
            return String(localized: Strings.NetworkError.requestFailed(error.localizedDescription))
            
        case .invalidStatusCode(let code):
            return String(localized: Strings.NetworkError.invalidStatusCode(code))
            
        case .noData:
            return String(localized: Strings.NetworkError.noData)
        }
    }
}
