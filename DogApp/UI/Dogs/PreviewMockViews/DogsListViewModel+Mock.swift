//
//  DogsListViewModel+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
final class MockFetchDogsUseCase: FetchDogsUseCaseType {
    var shouldFail: Bool
    var dogsToReturn: [Dog]
    
    init(shouldFail: Bool = false, dogsToReturn: [Dog] = [StubDog.mock, StubDog.mockLongDescription]) {
        self.shouldFail = shouldFail
        self.dogsToReturn = dogsToReturn
    }
    
    func execute() async throws -> [Dog] {
        if shouldFail {
            throw NetworkError.noData
        } else {
            return dogsToReturn
        }
    }
}
#endif
