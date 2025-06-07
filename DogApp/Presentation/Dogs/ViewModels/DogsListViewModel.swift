//
//  DogsListViewModel.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation
import Combine

final class DogsListViewModel: DogsListViewModelType {
    
    @Published var dogs: [DogViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let fetchDogsUseCase: FetchDogsUseCaseType
    
    init(fetchDogsUseCase: FetchDogsUseCaseType) {
        self.fetchDogsUseCase = fetchDogsUseCase
    }
    
    func onAppear() async {
        await loadDogs()
    }
    
    private func loadDogs() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let dogsFromDomain = try await fetchDogsUseCase.execute()
            dogs = DogViewModelMapper.map(from: dogsFromDomain)
        } catch {
            errorMessage = String(localized: Strings.DogsList.loadingError)
        }
        
        isLoading = false
    }
}

extension DogsListViewModel {
    enum ViewState: Equatable {
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
