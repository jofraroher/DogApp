//
//  MockDogLocalDataSource.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

@testable import DogApp

final class MockDogLocalDataSource: DogLocalDataSourceType {
    
    var stubbedIsEmpty: Bool = true
    var stubbedLoadDogsResult: [DogDTO] = []
    var loadDogsCalled = false
    var savedDogs: [DogDTO] = []
    
    func isEmpty() -> Bool {
        stubbedIsEmpty
    }
    
    func loadDogs() throws -> [DogDTO] {
        loadDogsCalled = true
        return stubbedLoadDogsResult
    }
    
    func saveDogs(_ dogs: [DogDTO]) throws {
        savedDogs = dogs
    }
}
