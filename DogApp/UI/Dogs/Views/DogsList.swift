//
//  DogsList.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogsList: View {
    
    let dogs: [DogViewModel]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
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
