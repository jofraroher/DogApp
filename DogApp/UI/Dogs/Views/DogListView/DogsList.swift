//
//  DogsList.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogsList: View {
    
    let dogs: [Dog]
    
    let stackSpacing: CGFloat
    
    init(
        dogs: [Dog],
        stackSpacing: CGFloat = ConstantsLayout.DogListLayout.stackSpacing
    ) {
        self.dogs = dogs
        self.stackSpacing = stackSpacing
    }

    var body: some View {
        ScrollView {
            VStack(spacing: stackSpacing) {
                ForEach(dogs) { dog in
                    DogCardView(dog: dog)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
            .accessibilityIdentifier("dogsList")
        }
    }
}

#Preview {
    DogsList(dogs: [StubDog.mock, StubDog.mockLongDescription])
}
