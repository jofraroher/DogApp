//
//  SwiftDataStorageTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest
import SwiftData

@testable import DogApp

final class SwiftDataStorageTests: XCTestCase {
    
    func testSaveReplacesPreviousData() throws {
        // ARRANGE
        let sut = try makeSUT()
        let initialDogs: [DogDTO] = [TestData.dog]
        let newDogs: [DogDTO] = [TestData.secondDog]
        // ACT
        try sut.storage.save(initialDogs)
        try sut.storage.save(newDogs)
        let loaded = try sut.storage.load()
        // ASSERT
        XCTAssertEqual(loaded.count, 1)
        XCTAssertEqual(loaded.first?.id, "2")
        XCTAssertEqual(loaded.first?.name, "Tobi")
    }
    
    func testLoadReturnsSavedData() throws {
        // ARRANGE
        let sut = try makeSUT()
        let expectedDogs: [DogDTO] = [
            TestData.dog,
            TestData.secondDog
        ]
        // ACT
        try sut.storage.save(expectedDogs)
        let loadedDogs = try sut.storage.load()
        // ASSERT
        XCTAssertEqual(loadedDogs.count, 2)
        XCTAssertTrue(loadedDogs.contains(where: { $0.name == "Luna" }))
        XCTAssertTrue(loadedDogs.contains(where: { $0.name == "Tobi" }))
    }
    
    func testIsEmptyReturnsTrueWhenNoDataIsSaved() throws {
        // ARRANGE
        let sut = try makeSUT()
        // ACT
        let result = sut.storage.isEmpty()
        // ASSERT
        XCTAssertTrue(result)
    }
    
    private func makeSUT() throws -> SutStructure {
        let container = try ModelContainer(
            for: DogEntity.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let context = ModelContext(container)
        let storage: SwiftDataStorage<DogEntity> = SwiftDataStorage(context: context)
        
        let sutStructure: SutStructure = SutStructure(
            storage: storage,
            context: context,
            container: container
        )
        return sutStructure
    }
    
    struct SutStructure {
        let storage: SwiftDataStorage<DogEntity>
        let context: ModelContext
        let container: ModelContainer
    }
}
