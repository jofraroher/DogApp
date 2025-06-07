//
//  MockNetworkClient.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

@testable import DogApp

final class MockNetworkClient: NetworkClientType {
    
    var requestCalled = false

    private let result: Result<[DogDTO], Error>

    init(result: Result<[DogDTO], Error>) {
        self.result = result
    }

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        requestCalled = true
        switch result {
        case .success(let value as T):
            return value
        case .failure(let error):
            throw error
        default:
            fatalError("Unexpected type or value")
        }
    }
}
