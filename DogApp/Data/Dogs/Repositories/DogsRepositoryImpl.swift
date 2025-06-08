//
//  DogsRepositoryImpl.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

/// Concrete implementation of `DogsRepositoryType`.
///
/// Combines remote and local data sources to retrieve dog information.
/// Use `remoteDataSource` for fresh data, and `localDataSource` for caching or fallback.
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
}
