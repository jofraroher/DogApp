//
//  FetchDogsUseCase.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

/// Use case responsible for fetching dog data from the repository.
///
/// This use case decouples the presentation layer from data sources,
/// allowing flexible implementation for remote/local or mock data sources.
final class FetchDogsUseCase: FetchDogsUseCaseType {
    
    private let repository: DogsRepositoryType

    init(repository: DogsRepositoryType) {
        self.repository = repository
    }

    func execute() async throws -> [Dog] {
        try await repository.fetchDogs()
    }
}
