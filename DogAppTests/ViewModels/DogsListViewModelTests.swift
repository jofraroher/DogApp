//
//  DogsListViewModelTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class DogsListViewModelTests: XCTestCase {
    
    @MainActor
    func testOnAppearLoadsDogsSuccessfully() async {
        // ARRANGE
        let sut = makeSUT()
        sut.useCase.dogsToReturn = [TestData.dog]
        
        // ACT
        await sut.viewModel.onAppear()
        
        // ASSERT
        XCTAssertEqual(sut.viewModel.dogs.count, 1)
        XCTAssertEqual(sut.viewModel.dogs.first?.id, TestData.dog.id)
        XCTAssertFalse(sut.viewModel.isLoading)
        XCTAssertNil(sut.viewModel.errorMessage)
        
        if case .loaded(let dogs) = sut.viewModel.state {
            XCTAssertEqual(dogs.first?.id, TestData.dog.id)
        } else {
            XCTFail("Expected state to be .loaded")
        }
    }
    
    @MainActor
    func testOnAppearHandlesErrorState() async {
        // ARRANGE
        let sut = makeSUT()
        sut.useCase.shouldFail = true

        // ACT
        await sut.viewModel.onAppear()

        // ASSERT
        XCTAssertTrue(sut.viewModel.dogs.isEmpty)
        XCTAssertFalse(sut.viewModel.isLoading)
        XCTAssertNotNil(sut.viewModel.errorMessage)

        if case .error(let message) = sut.viewModel.state {
            XCTAssertEqual(message, sut.viewModel.errorMessage)
        } else {
            XCTFail("Expected state to be .error")
        }
    }
    
    @MainActor
    func testOnAppearWithEmptyListShowsEmptyState() async {
        // ARRANGE
        let sut = makeSUT()
        sut.useCase.dogsToReturn = []

        // ACT
        await sut.viewModel.onAppear()

        // ASSERT
        XCTAssertTrue(sut.viewModel.dogs.isEmpty)
        XCTAssertNil(sut.viewModel.errorMessage)
        XCTAssertFalse(sut.viewModel.isLoading)
        XCTAssertEqual(sut.viewModel.state, .empty)
    }

    @MainActor
    private func makeSUT() -> SutStructure {
        let mockUseCase = MockFetchDogsUseCase()
        let viewModel = DogsListViewModel(fetchDogsUseCase: mockUseCase)
        
        let sutStructure: SutStructure = SutStructure(
            viewModel: viewModel,
            useCase: mockUseCase
        )
        return sutStructure
    }

    struct SutStructure {
        let viewModel: DogsListViewModel
        let useCase: MockFetchDogsUseCase
    }
}
