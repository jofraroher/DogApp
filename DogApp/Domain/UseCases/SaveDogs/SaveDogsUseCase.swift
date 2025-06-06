//
//  SaveDogsUseCase.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

final class SaveDogsUseCase: SaveDogsUseCaseType {
    
    private let repository: DogsRepositoryType

    init(repository: DogsRepositoryType) {
        self.repository = repository
    }

    func execute(dogs: [Dog]) async throws {
        try await repository.saveDogs(dogs)
    }
}
