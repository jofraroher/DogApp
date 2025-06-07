//
//  DogCardContentView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogCardContentView: View {
    
    let dog: DogViewModel

    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .clipShape(RoundedCornerShape())
                .frame(height: 170)
                .shadow(color: Color.black.opacity(0.12), radius: 6, x: 0, y: 3)
            

            VStack(alignment: .leading, spacing: 20) {
                Text(dog.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text(dog.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)

                Text(Strings.DogCard.dogAgeTitle(dog.age))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DogCardContentView(dog: .mock)
        .padding()
}
