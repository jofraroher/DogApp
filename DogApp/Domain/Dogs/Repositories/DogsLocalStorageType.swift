//
//  DogsLocalStorageType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol DogsLocalStorageType {
    func save(_ dogs: [DogDTO]) throws
    func load() throws -> [DogDTO]
    func isEmpty() -> Bool
}
