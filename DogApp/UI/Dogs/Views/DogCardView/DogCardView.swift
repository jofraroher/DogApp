//
//  DogCardView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogCardView: View {
    let dog: DogViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            DogImageView(url: dog.imageURL)
                .offset(x: 6)
                .zIndex(1)

            DogCardContentView(dog: dog)
                .offset(y: 12)
                .padding(.leading, 6)
                .zIndex(0)
                .frame(height: 200)
        }
        .frame(height: 200)
        .padding(.bottom, 16)
    }
}

struct DogCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DogCardView(dog: .mock)
                .previewDisplayName("Dog Card - Default")

            DogCardView(dog: .mockLongDescription)
                .previewDisplayName("Dog Card - Long Description")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
