//
//  DogCardView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogCardView: View {
    let dog: DogViewModel

    private let imageSize = CGSize(width: 130, height: 200)
    private let cardHeight: CGFloat = 170
    private let imageOffsetX: CGFloat = 6
    private let cardOffsetX: CGFloat = -6
    private let cardOffsetY: CGFloat = 15

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            dogImage
                .offset(x: imageOffsetX)
                .zIndex(1)

            dogCard
                .offset(x: cardOffsetX, y: cardOffsetY)
                .padding(.leading, 6)
                .zIndex(0)
                .frame(height: imageSize.height)
        }
        .frame(height: imageSize.height)
        .padding(.bottom, 16)
    }

    private var dogImage: some View {
        AsyncImage(url: dog.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
                    .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }

    private var dogCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .systemBackground))
                .frame(height: cardHeight)
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

                Text("Almost \(dog.age) years")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DogCardView(dog: .mock)
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

extension DogViewModel {
    static var mock: DogViewModel {
        DogViewModel(
            id: "1",
            name: "Luna",
            description: "Una perrita muy amigable y cariñosa.",
            imageURL: URL(string: "https://place-puppy.com/200x200")!,
            age: 2
        )
    }

    static var mockLongDescription: DogViewModel {
        DogViewModel(
            id: "2",
            name: "Rocky",
            description: "Un perro con una historia muy interesante. Rescatado de las montañas, hoy vive feliz en su nuevo hogar.",
            imageURL: URL(string: "https://place-puppy.com/200x200")!,
            age: 2
        )
    }
}
