//
//  DogRemoteDataSource.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

final class DogRemoteDataSource: DogRemoteDataSourceType {

    private let networkClient: NetworkClientType
    private let config: APIConfigurationType
    
    init(
        networkClient: NetworkClientType = NetworkClient(),
        config: APIConfigurationType = APIConfiguration.default
    ) {
        self.networkClient = networkClient
        self.config = config
    }

    func fetchDogs() async throws -> [DogDTO] {
        let endpoint = Endpoint(
            baseURL: config.baseURL,
            path: config.path,
            method: .get
        )

        return try await networkClient.request(endpoint)
    }
}
