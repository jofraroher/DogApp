//
//  NetworkClientType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol NetworkClientType {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
