//
//  MockDogRemoteDataSource.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

@testable import DogApp

final class MockDogRemoteDataSource: DogRemoteDataSourceType {
    
    private let result: Result<[DogDTO], Error>
    private(set) var fetchDogsCalled = false
    
    init(result: Result<[DogDTO], Error>) {
        self.result = result
    }

    func fetchDogs() async throws -> [DogDTO] {
        fetchDogsCalled = true
        switch result {
        case .success(let dogs):
            return dogs
        case .failure(let error):
            throw error
        }
    }
}
