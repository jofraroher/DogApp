//
//  ErrorView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct ErrorView: View {
    
    let title: String
    let buttonTitle: String
    let retryAction: () -> Void
    let stackSpacing: CGFloat
    
    init(
        title: String,
        buttonTitle: String,
        retryAction: @escaping () -> Void,
        stackSpacing: CGFloat = ConstantsLayout.ErrorViewLayout.stackSpacing
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.retryAction = retryAction
        self.stackSpacing = stackSpacing
    }

    var body: some View {
        VStack(spacing: stackSpacing) {
            Text(title)
                .foregroundColor(.red)
            Button(buttonTitle, action: retryAction)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView(
        title: String(localized: Strings.DogsList.loadingError),
        buttonTitle: String(localized: Strings.DogsList.retryButtonTitle),
        retryAction: { }
    )
}
