//
//  FetchDogsUseCaseType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol FetchDogsUseCaseType {
    func execute() async throws -> [Dog]
}
