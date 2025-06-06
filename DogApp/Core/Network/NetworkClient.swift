//
//  NetworkClient.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

final class NetworkClient: NetworkClientType {
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.urlRequest()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.noData
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            throw NetworkError.decodingError(decodingError)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
