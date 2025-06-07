//
//  DogViewModelMapperTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class DogViewModelMapperTests: XCTestCase {

    func testMapSingleDogCreatesExpectedViewModel() {
        // ARRANGE
        let dog = TestData.dog

        // ACT
        let viewModel = DogViewModelMapper.map(from: dog)

        // ASSERT
        XCTAssertEqual(viewModel.id, dog.id)
        XCTAssertEqual(viewModel.name, "Luna")
        XCTAssertEqual(viewModel.description, dog.description)
        XCTAssertEqual(viewModel.imageURL?.absoluteString, dog.image)
        XCTAssertEqual(viewModel.age, dog.age)
    }

    func testMapDogListReturnsExpectedViewModels() {
        // ARRANGE
        let dogs = [
            TestData.dog,
            TestData.secondDog
        ]

        // ACT
        let viewModels = DogViewModelMapper.map(from: dogs)

        // ASSERT
        XCTAssertEqual(viewModels.count, 2)
        XCTAssertEqual(viewModels[0].name, "Luna")
        XCTAssertEqual(viewModels[1].name, "Tobi")
    }
}
