//
//  DogsListViewModel+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
import Foundation

extension DogsListViewModel {
    
    static var mockWithDogs: DogsListViewModel {
        let dogsUseCaseMock = MockFetchDogsUseCase()
        dogsUseCaseMock.dogs = [.mock, .mockLongDescription]
        let vm = DogsListViewModel(fetchDogsUseCase: dogsUseCaseMock)
        vm.isLoading = false
        vm.errorMessage = nil
        return vm
    }

    static var mockLoading: DogsListViewModel {
        let vm = DogsListViewModel(fetchDogsUseCase: MockFetchDogsUseCase())
        vm.isLoading = true
        vm.errorMessage = nil
        return vm
    }

    static var mockError: DogsListViewModel {
        let dogsUseCaseMock = MockFetchDogsUseCase()
        dogsUseCaseMock.errorResponse = true
        let vm = DogsListViewModel(fetchDogsUseCase: dogsUseCaseMock)
        vm.isLoading = false
        vm.errorMessage = "No se pudo cargar los perros"
        return vm
    }

    static var mockEmpty: DogsListViewModel {
        let vm = DogsListViewModel(fetchDogsUseCase: MockFetchDogsUseCase())
        vm.isLoading = false
        vm.errorMessage = nil
        return vm
    }
}
#endif
