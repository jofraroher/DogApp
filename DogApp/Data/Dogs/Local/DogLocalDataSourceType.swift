//
//  DogLocalDataSourceType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol DogLocalDataSourceType {
    func saveDogs(_ dogs: [DogDTO]) throws
    func loadDogs() throws -> [DogDTO]
    func isEmpty() -> Bool
}
