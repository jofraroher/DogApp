//
//  MockDogsRepository.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

@testable import DogApp

final class MockDogsRepository: DogsRepositoryType {
    
    var result: Result<[Dog], Error>
    private(set) var fetchDogsCalled = false
    
    init(result: Result<[Dog], Error>) {
        self.result = result
    }
    
    func fetchDogs() async throws -> [Dog] {
        fetchDogsCalled = true
        return try result.get()
    }
}
