//
//  AppEnvironment.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation
import SwiftData

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
    static func mockLoading() -> AppEnvironment {
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
