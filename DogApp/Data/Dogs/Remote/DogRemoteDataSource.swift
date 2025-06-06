//
//  DogRemoteDataSource.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

final class DogRemoteDataSource: DogRemoteDataSourceType {

    private let networkClient: NetworkClientType

    init(networkClient: NetworkClientType = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchDogs() async throws -> [DogDTO] {
        let endpoint = Endpoint(
            baseURL: "https://jsonblob.com",
            path: "/api/1151549092634943488",
            method: .get
        )

        return try await networkClient.request(endpoint)
    }
}
