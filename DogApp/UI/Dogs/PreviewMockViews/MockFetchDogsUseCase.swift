//
//  MockFetchDogsUseCase.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
import Foundation

final class MockFetchDogsUseCase: FetchDogsUseCaseType {
    
    var dogs: [Dog] = []
    var errorResponse: Bool = false
    
    func execute() async throws -> [Dog] {
        if errorResponse {
            throw NetworkError.noData
        }
        return dogs
    }
}
#endif
