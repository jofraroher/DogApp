//
//  DogsListViewModelType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Combine

@MainActor
protocol DogsListViewModelType: ObservableObject {
    var dogs: [Dog] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    var state: DogsListViewModel.ViewState { get }

    func onAppear() async
}
