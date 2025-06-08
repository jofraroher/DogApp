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
    @State private var environment: AppEnvironment?

    var body: some View {
        Group {
            if let environment {
                DogsListView(viewModel: environment.makeDogsListViewModel())
            } else {
                LoadingView(title: String(localized: Strings.DogsList.loadingTitle))
            }
        }
        .task {
            environment = AppEnvironment.live(context: context)
        }
    }
}
