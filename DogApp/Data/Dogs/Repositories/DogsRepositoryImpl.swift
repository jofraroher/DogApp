//
//  DogsRepositoryImpl.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

final class DogsRepositoryImpl: DogsRepositoryType {

    private let remoteDataSource: DogRemoteDataSourceType
    private let localDataSource: DogLocalDataSourceType

    init(
        remoteDataSource: DogRemoteDataSourceType,
        localDataSource: DogLocalDataSourceType
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func fetchDogs() async throws -> [Dog] {
        if localDataSource.isEmpty() {
            let remoteDogs = try await remoteDataSource.fetchDogs()
            try localDataSource.saveDogs(remoteDogs)
            return remoteDogs.map { $0.toDomain() }
        } else {
            let localDogs = try localDataSource.loadDogs()
            return localDogs.map { $0.toDomain() }
        }
    }

    private func saveDogs(_ dogs: [Dog]) async throws {
        let dtos = dogs.map {
            DogDTO(id: $0.id, name: $0.name, description: $0.description, image: $0.image, age: $0.age)
        }
        try localDataSource.saveDogs(dtos)
    }
}
