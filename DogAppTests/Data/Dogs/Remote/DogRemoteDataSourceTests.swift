//
//  DogRemoteDataSourceTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class DogRemoteDataSourceTests: XCTestCase {
    
    func testFetchDogsReturnsExpectedData() async throws {
        // ARRANGE
        let sut = makeSUT(result: .success([TestData.dog]))
        // ACT
        let dogs = try await sut.dataSource.fetchDogs()
        
        // ASSERT
        XCTAssertEqual(dogs.count, 1)
        XCTAssertTrue(sut.networkClient.requestCalled)
    }
    
    func testFetchDogsThrowsError() async {
        // ARRANGE
        let sut = makeSUT(result: .failure(NetworkError.badURL))
        // ACT
        do {
            _ = try await sut.dataSource.fetchDogs()
            XCTFail("Expected error to be thrown")
        } catch {
            // ASSERT
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    private func makeSUT(result: Result<[DogDTO], Error>) -> SutStructure {
        let networkClient = MockNetworkClient(result: result)
        let dataSource = DogRemoteDataSource(networkClient: networkClient)
        
        let sutStructure: SutStructure = SutStructure(
            dataSource: dataSource,
            networkClient: networkClient
        )
        return sutStructure
    }
    
    struct SutStructure {
        let dataSource: DogRemoteDataSource
        let networkClient: MockNetworkClient
    }
}
