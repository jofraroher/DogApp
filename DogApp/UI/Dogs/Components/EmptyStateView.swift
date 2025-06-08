//
//  EmptyView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundStyle(.textPrimary)
            .accessibilityIdentifier("emptyStateLabel")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyStateView(message: String(localized: Strings.DogsList.noDogsAvailableMessage))
}
