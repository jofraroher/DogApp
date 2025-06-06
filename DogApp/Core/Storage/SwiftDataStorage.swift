//
//  SwiftDataStorage.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation
import SwiftData

final class SwiftDataStorage<Entity: PersistentModel & DTOTransformable>: EntityStorage {
    typealias Item = Entity.DTOType

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ items: [Item]) throws {
        let fetchDescriptor = FetchDescriptor<Entity>()
        let existing = try context.fetch(fetchDescriptor)
        existing.forEach { context.delete($0) }

        items.map { Entity.fromDTO($0) }.forEach { context.insert($0) }

        try context.save()
    }

    func load() throws -> [Item] {
        let fetchDescriptor = FetchDescriptor<Entity>()
        let result = try context.fetch(fetchDescriptor)
        return result.map { $0.toDTO() }
    }

    func isEmpty() -> Bool {
        (try? context.fetchCount(FetchDescriptor<Entity>())) == 0
    }
}
