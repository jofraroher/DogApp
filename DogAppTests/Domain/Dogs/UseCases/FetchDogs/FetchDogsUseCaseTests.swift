//
//  FetchDogsUseCaseTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class FetchDogsUseCaseTests: XCTestCase {
    
    func testExecuteReturnsDogs() async throws {
        // ARRANGE
        let expectedDogs = [TestData.dog.toDomain()]
        let sut = makeSUT(result: .success(expectedDogs))
        // ACT
        let result = try await sut.useCase.execute()
        // ASSERT
        XCTAssertEqual(result, expectedDogs)
        XCTAssertTrue(sut.repository.fetchDogsCalled)
    }
    
    func testExecuteThrowsError() async {
        // ARRANGE
        let sut = makeSUT(result: .failure(NetworkError.noData))
        // ACT
        do {
            _ = try await sut.useCase.execute()
            XCTFail("Expected error to be thrown")
        } catch {
            // ASSERT
            XCTAssertTrue(sut.repository.fetchDogsCalled)
        }
    }
    
    private func makeSUT(result: Result<[Dog], Error>) -> SutStructure {
        let repository = MockDogsRepository(result: result)
        let useCase = FetchDogsUseCase(repository: repository)
        
        let sutStructure: SutStructure = SutStructure(
            useCase: useCase,
            repository: repository
        )
        return sutStructure
    }

    struct SutStructure {
        let useCase: FetchDogsUseCase
        let repository: MockDogsRepository
    }
}
