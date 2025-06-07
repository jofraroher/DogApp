//
//  DogsListViewModel+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
import Foundation

final class MockDogsListViewModel: DogsListViewModelType {

    var dogs: [DogViewModel] = []
    var isLoading: Bool = false
    var errorMessage: String? = nil
    var state: DogsListViewModel.ViewState = .empty
    
    func onAppear() { }
}

extension MockDogsListViewModel {
    static var withDogs: MockDogsListViewModel {
        let vm = MockDogsListViewModel()
        vm.dogs = [.mock, .mockLongDescription]
        vm.state = .loaded(vm.dogs)
        return vm
    }
    
    static var loading: MockDogsListViewModel {
        let vm = MockDogsListViewModel()
        vm.isLoading = true
        vm.state = .loading
        return vm
    }
    
    static var error: MockDogsListViewModel {
        let vm = MockDogsListViewModel()
        let message = String(localized: Strings.DogsList.loadingError)
        vm.errorMessage = message
        vm.state = .error(message)
        return vm
    }
    
    static var empty: MockDogsListViewModel {
        let vm = MockDogsListViewModel()
        vm.dogs = []
        vm.state = .empty
        return vm
    }
}
#endif
