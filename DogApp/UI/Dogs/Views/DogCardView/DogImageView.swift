//
//  DogImageView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogImageView: View {
    
    let url: URL?
    private let size = CGSize(width: 130, height: 200)

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: size.width, height: size.height)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
                    .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
            case .failure:
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "photo.badge.exclamationmark.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }
                .frame(width: size.width, height: size.height)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    DogImageView(url: nil)
        .padding()
}
