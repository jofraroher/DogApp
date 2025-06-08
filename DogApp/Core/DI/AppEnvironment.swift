//
//  AppEnvironment.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation
import SwiftData

/// Factory container for building application environments (real or mocked).
///
/// Responsibilities:
/// - Provide `makeDogsListViewModel()` to build the appropriate view model
/// - Centralize dependency wiring (e.g., data sources, repositories, use cases)
/// - Enable controlled testing by exposing mocks for UI Test scenarios
///
/// Extend this structure as needed for other screens or view models.
struct AppEnvironment {

    let makeDogsListViewModel: @MainActor () -> DogsListViewModel

    @MainActor
    static func live(context: ModelContext) -> AppEnvironment {
        let storage = SwiftDataStorage<DogEntity>(context: context)
        let localDataSource = DogLocalDataSource(storage: storage)
        let remoteDataSource = DogRemoteDataSource()

        let repository = DogsRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )

        let useCase = FetchDogsUseCase(repository: repository)
        
        return AppEnvironment {
            DogsListViewModel(fetchDogsUseCase: useCase)
        }
    }

    @MainActor
    static func mockSuccess() -> AppEnvironment {
        return AppEnvironment {
            DogsListViewModel(fetchDogsUseCase: MockFetchDogsUseCase())
        }
    }
    
    @MainActor
    static func mockEmpty() -> AppEnvironment {
        let useCase = MockFetchDogsUseCase(dogsToReturn: [])
        return AppEnvironment {
            DogsListViewModel(fetchDogsUseCase: useCase)
        }
    }

    @MainActor
    static func mockError() -> AppEnvironment {
        let useCase = MockFetchDogsUseCase(shouldFail: true)
        return AppEnvironment {
            DogsListViewModel(fetchDogsUseCase: useCase)
        }
    }
}
