//
//  DogsListViewModel.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation
import Combine

@MainActor
final class DogsListViewModel: ObservableObject {
    
    @Published var dogs: [DogViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let fetchDogsUseCase: FetchDogsUseCaseType

    init(fetchDogsUseCase: FetchDogsUseCaseType) {
        self.fetchDogsUseCase = fetchDogsUseCase
    }

    func onAppear() {
        Task {
            await loadDogs()
        }
    }

    private func loadDogs() async {
        isLoading = true
        errorMessage = nil

        do {
            let dogsFromDomain = try await fetchDogsUseCase.execute()
            dogs = DogViewModelMapper.map(from: dogsFromDomain)
        } catch {
            errorMessage = "Error al cargar los perros"
        }

        isLoading = false
    }
}

extension DogsListViewModel {

    enum ViewState {
        case loading
        case error(String)
        case empty
        case loaded([DogViewModel])
    }

    var state: ViewState {
        if isLoading {
            return .loading
        } else if let errorMessage = errorMessage {
            return .error(errorMessage)
        } else if dogs.isEmpty {
            return .empty
        } else {
            return .loaded(dogs)
        }
    }
}
