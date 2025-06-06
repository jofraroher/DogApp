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
        case .badURL: return "Invalid URL"
        case .decodingError(let e): return "Decoding error: \(e.localizedDescription)"
        case .requestFailed(let e): return "Request failed: \(e.localizedDescription)"
        case .invalidStatusCode(let code): return "Invalid status code: \(code)"
        case .noData: return "No data received"
        }
    }
}
