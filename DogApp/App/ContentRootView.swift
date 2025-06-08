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
    private var initialEnvironment: AppEnvironment?

    init(environment: AppEnvironment? = nil) {
        self.initialEnvironment = environment
    }
    
    var body: some View {
        Group {
            if let environment {
                DogsListView(viewModel: environment.makeDogsListViewModel())
            } else {
                LoadingView(title: String(localized: Strings.DogsList.loadingTitle))
            }
        }
        .task {
            if let initialEnvironment {
                self.environment = initialEnvironment
            } else if ProcessInfo.processInfo.arguments.contains("-UITEST_EMPTY_STATE") {
                self.environment = AppEnvironment.mockEmpty()
            } else if ProcessInfo.processInfo.arguments.contains("-UITEST_ERROR_STATE") {
                self.environment = AppEnvironment.mockError()
            } else if ProcessInfo.processInfo.arguments.contains("-UITEST_SUCCESS_STATE") {
                self.environment = AppEnvironment.mockSuccess()
            } else {
                self.environment = AppEnvironment.live(context: context)
            }
        }
    }
}
