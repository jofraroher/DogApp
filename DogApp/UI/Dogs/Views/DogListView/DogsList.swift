//
//  DogsList.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogsList: View {
    
    let dogs: [DogViewModel]
    
    let stackSpacing: CGFloat
    
    init(
        dogs: [DogViewModel],
        stackSpacing: CGFloat = ConstantsLayout.DogListLayout.stackSpacing
    ) {
        self.dogs = dogs
        self.stackSpacing = stackSpacing
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: stackSpacing) {
                ForEach(dogs) { dog in
                    DogCardView(dog: dog)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    DogsList(dogs: [.mock, .mockLongDescription])
}
