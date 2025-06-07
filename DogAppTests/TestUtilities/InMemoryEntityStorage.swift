//
//  InMemoryEntityStorage.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

@testable import DogApp

final class InMemoryEntityStorage<T>: EntityStorage {
    private var entities: [T] = []

    func save(_ entities: [T]) throws {
        self.entities = entities
    }

    func load() throws -> [T] {
        return entities
    }

    func isEmpty() -> Bool {
        return entities.isEmpty
    }
}
