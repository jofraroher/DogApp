//
//  FetchDogsUseCase.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

final class FetchDogsUseCase: FetchDogsUseCaseType {
    
    private let repository: DogsRepositoryType

    init(repository: DogsRepositoryType) {
        self.repository = repository
    }

    func execute() async throws -> [Dog] {
        try await repository.fetchDogs()
    }
}
