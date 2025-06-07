//
//  DogLocalDataSourceTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class DogLocalDataSourceTests: XCTestCase {
    
    func testSaveAndLoadDogs() throws {
        // ARRANGE
        let sut = makeSUT()
        let expected = [TestData.dog]
        // ACT
        try sut.dataSource.saveDogs(expected)
        let loaded = try sut.dataSource.loadDogs()
        // ASSERT
        XCTAssertEqual(loaded.count, expected.count)
        XCTAssertEqual(loaded.first?.id, expected.first?.id)
    }
    
    func testIsEmptyReturnsTrueWhenNoDataSaved() {
        // ARRANGE
        let sut = makeSUT()
        // ACT / ASSERT
        XCTAssertTrue(sut.dataSource.isEmpty())
    }
    
    func testIsEmptyReturnsFalseWhenDataSaved() throws {
        // ARRANGE
        let sut = makeSUT()
        // ACT
        try sut.dataSource.saveDogs([TestData.dog])
        // ASSERT
        XCTAssertFalse(sut.dataSource.isEmpty())
    }
    
    private func makeSUT() -> SutStructure {
        let storage = InMemoryEntityStorage<DogDTO>()
        let dataSource = DogLocalDataSource(storage: storage)
        
        let sutStructure: SutStructure = SutStructure(
            dataSource: dataSource,
            storage: storage
        )
        return sutStructure
    }
    
    struct SutStructure {
        let dataSource: DogLocalDataSource
        let storage: InMemoryEntityStorage<DogDTO>
    }
}
