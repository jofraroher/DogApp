//
//  DogImageView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogImageView: View {
    
    let url: URL?
    
    let errorImageName: String
    let errorImageSize: CGFloat
    let size: CGSize
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    
    init(
        url: URL?,
        errorImageName: String = ConstantsLayout.DogImageViewLayout.errorImageName,
        errorImageSize: CGFloat = ConstantsLayout.DogImageViewLayout.errorImageSize,
        size: CGSize = ConstantsLayout.DogImageViewLayout.size,
        backgroundColor: Color = ConstantsLayout.DogImageViewLayout.backgroundColor,
        cornerRadius: CGFloat = ConstantsLayout.DogImageViewLayout.cornerRadius,
        shadowColor: Color = ConstantsLayout.DogImageViewLayout.shadowColor,
        shadowRadius: CGFloat = ConstantsLayout.DogImageViewLayout.shadowRadius,
        shadowX: CGFloat = ConstantsLayout.DogImageViewLayout.shadowX,
        shadowY: CGFloat = ConstantsLayout.DogImageViewLayout.shadowY
    ) {
        self.url = url
        self.errorImageName = errorImageName
        self.errorImageSize = errorImageSize
        self.size = size
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
    }

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: size.width, height: size.height)
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .shadow(
                        color: shadowColor,
                        radius: shadowRadius,
                        x: shadowX,
                        y: shadowY
                    )
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .clipped()
                    .shadow(
                        color: shadowColor,
                        radius: shadowRadius,
                        x: shadowX,
                        y: shadowY
                    )
            case .failure:
                ZStack {
                    backgroundColor
                    
                    Image(systemName: errorImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: errorImageSize,
                            height: errorImageSize
                        )
                        .foregroundColor(.gray)
                }
                .frame(width: size.width, height: size.height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(
                    color: shadowColor,
                    radius: shadowRadius,
                    x: shadowX,
                    y: shadowY
                )
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
