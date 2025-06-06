//
//  SaveDogsUseCaseType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol SaveDogsUseCaseType {
    func execute(dogs: [Dog]) async throws
}
