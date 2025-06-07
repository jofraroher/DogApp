//
//  DogsRepositoryTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class DogsRepositoryTests: XCTestCase {
    
    func testFetchDogsReturnsFromLocalIfNotEmpty() async throws {
        // ARRANGE
        let dogs = [TestData.dog, TestData.secondDog]
        let sut = makeSUT(result: .success(dogs))
        sut.localDataSource.stubbedIsEmpty = false
        sut.localDataSource.stubbedLoadDogsResult = dogs
        // ACT
        let result = try await sut.repository.fetchDogs()
        // ASSERT
        XCTAssertEqual(result.count, dogs.count)
        XCTAssertTrue(sut.localDataSource.loadDogsCalled)
        XCTAssertFalse(sut.remoteDataSource.fetchDogsCalled)
    }
    
    func testFetchDogsCallsRemoteAndSavesIfLocalIsEmpty() async throws {
        // ARRANGE
        let dogs = [TestData.dog, TestData.secondDog]
        let sut = makeSUT(result: .success(dogs))
        sut.localDataSource.stubbedIsEmpty = true
        // ACT
        let result = try await sut.repository.fetchDogs()
        // ASSERT
        XCTAssertEqual(result.count, dogs.count)
        XCTAssertTrue(sut.remoteDataSource.fetchDogsCalled)
        XCTAssertEqual(sut.localDataSource.savedDogs.count, dogs.count)
    }
    
    func testFetchDogsThrowsWhenRemoteFails() async {
        // ARRANGE
        let sut = makeSUT(result: .failure(NetworkError.noData))
        sut.localDataSource.stubbedIsEmpty = true
        // ACT
        do {
            _ = try await sut.repository.fetchDogs()
            XCTFail("Expected error to be thrown")
        } catch {
            // ASSERT
            XCTAssertTrue(sut.remoteDataSource.fetchDogsCalled)
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    private func makeSUT(result: Result<[DogDTO], Error>) -> SutStructure {
        let remoteDataSource = MockDogRemoteDataSource(result: result)
        let localDataSource = MockDogLocalDataSource()
        let repository = DogsRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )
        
        let sutStructure: SutStructure = SutStructure(
            repository: repository,
            localDataSource: localDataSource,
            remoteDataSource: remoteDataSource
        )
        return sutStructure
    }
    
    struct SutStructure {
        let repository: DogsRepositoryImpl
        let localDataSource: MockDogLocalDataSource
        let remoteDataSource: MockDogRemoteDataSource
    }
}
