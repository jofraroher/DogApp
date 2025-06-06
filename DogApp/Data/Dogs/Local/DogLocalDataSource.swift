//
//  DogLocalDataSource.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

final class DogLocalDataSource: DogLocalDataSourceType {
    
    private let storage: any EntityStorage<DogDTO>

    init(storage: any EntityStorage<DogDTO>) {
        self.storage = storage
    }

    func saveDogs(_ dogs: [DogDTO]) throws {
        try storage.save(dogs)
    }

    func loadDogs() throws -> [DogDTO] {
        try storage.load()
    }

    func isEmpty() -> Bool {
        storage.isEmpty()
    }
}
