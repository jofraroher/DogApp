//
//  MockFetchDogsUseCase.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation

@testable import DogApp

final class MockFetchDogsUseCase: FetchDogsUseCaseType {

    var shouldFail: Bool = false
    var dogsToReturn: [Dog] = []

    func execute() async throws -> [Dog] {
        if shouldFail {
            throw NetworkError.noData
        } else {
            return dogsToReturn
        }
    }
}
