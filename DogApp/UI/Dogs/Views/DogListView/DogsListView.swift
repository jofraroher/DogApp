//
//  DogsListView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

/// Main view responsible for displaying the dog list.
///
/// Displays loading, error, empty or content states depending on `viewModel` state.
/// Should be initialized with a concrete implementation of `DogsListViewModelType`.
struct DogsListView<ViewModel: DogsListViewModelType>: View {

    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                content
            }
            .navigationTitle(Text(Strings.DogsList.navigationTitle))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            LoadingView(title: String(localized: Strings.DogsList.loadingTitle))
        case .error(let title):
            ErrorView(
                title: title,
                buttonTitle: String(localized: Strings.DogsList.retryButtonTitle),
                retryAction: {
                    Task {
                        await viewModel.onAppear()
                    }
                }
            )
        case .empty:
            EmptyStateView(message: String(localized: Strings.DogsList.noDogsAvailableMessage))
        case .loaded(let dogs):
            DogsList(dogs: dogs)
        }
    }
}

#Preview("List with data") {
    DogsListView(
        viewModel: AppEnvironment.mockSuccess().makeDogsListViewModel()
    )
}

#Preview("Error state") {
    DogsListView(
        viewModel: AppEnvironment.mockError().makeDogsListViewModel()
    )
}

#Preview("Empty list") {
    DogsListView(
        viewModel: AppEnvironment.mockEmpty().makeDogsListViewModel()
    )
}
