//
//  ContentRootView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI
import SwiftData

struct ContentRootView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        DogsListView(viewModel: makeDogsListViewModel())
    }

    private func makeDogsListViewModel() -> DogsListViewModel {
        let storage = SwiftDataStorage<DogEntity>(context: context)

        let localDataSource = DogLocalDataSource(storage: storage)
        let remoteDataSource = DogRemoteDataSource() // o inyectás NetworkClient

        let repository = DogsRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )

        let fetchUseCase = FetchDogsUseCase(repository: repository)

        return DogsListViewModel(fetchDogsUseCase: fetchUseCase)
    }
}
