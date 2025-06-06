//
//  EntityStorage.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol EntityStorage<Item> {

    associatedtype Item

    func save(_ items: [Item]) throws
    func load() throws -> [Item]
    func isEmpty() -> Bool
}
