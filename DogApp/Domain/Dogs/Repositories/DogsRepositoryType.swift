//
//  DogsRepositoryType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol DogsRepositoryType {
    func fetchDogs() async throws -> [Dog]
    func saveDogs(_ dogs: [Dog]) async throws
}
