//
//  DogsListView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogsListView: View {
    
    @StateObject private var viewModel: DogsListViewModel

    private var backgroundColor: some View {
        Color(UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1))
            .ignoresSafeArea()
    }
    
    init(viewModel: DogsListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                content
            }
            .navigationTitle("Dogs We Love")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear { viewModel.onAppear() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            LoadingView(title: "Cargando...")
        case .error(let message):
            ErrorView(title: "Reintentar", message: message, retryAction: viewModel.onAppear)
        case .empty:
            EmptyStateView(message: "No hay perros disponibles")
        case .loaded(let dogs):
            DogsList(dogs: dogs)
        }
    }
}

struct DogsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DogsListView(viewModel: .mockWithDogs)
                .previewDisplayName("Lista con datos")

            DogsListView(viewModel: .mockError)
                .previewDisplayName("Con error")

            DogsListView(viewModel: .mockEmpty)
                .previewDisplayName("Lista vacía")
        }
    }
}
