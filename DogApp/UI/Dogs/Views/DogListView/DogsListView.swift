//
//  DogsListView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

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
        .onAppear { viewModel.onAppear() }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            LoadingView(title: String(localized: Strings.DogsList.loadingTitle))
        case .error(let title):
            ErrorView(title: title, buttonTitle: String(localized: Strings.DogsList.retryButtonTitle), retryAction: viewModel.onAppear)
        case .empty:
            EmptyStateView(message: String(localized: Strings.DogsList.noDogsAvailableMessage))
        case .loaded(let dogs):
            DogsList(dogs: dogs)
        }
    }
}

struct DogsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DogsListView(viewModel: MockDogsListViewModel.withDogs)
                .previewDisplayName("List with data")
            
            DogsListView(viewModel: MockDogsListViewModel.loading)
                .previewDisplayName("Loading")
            
            DogsListView(viewModel: MockDogsListViewModel.error)
                .previewDisplayName("Error state")
            
            DogsListView(viewModel: MockDogsListViewModel.empty)
                .previewDisplayName("Empty list")
        }
    }
}
