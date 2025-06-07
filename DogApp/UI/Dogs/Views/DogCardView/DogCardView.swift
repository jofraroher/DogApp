//
//  DogCardView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogCardView: View {
    
    let dog: DogViewModel
    
    let stackSpacing: CGFloat
    let imageOffsetX: CGFloat
    let imageZIndex: CGFloat
    let contentOffsetY: CGFloat
    let contentLeftSpace: CGFloat
    let contentZIndex: CGFloat
    let frameHeight: CGFloat
    let bottomSpace: CGFloat
    
    init(
        dog: DogViewModel,
        stackSpacing: CGFloat = ConstantsLayout.DogCardViewLayout.stackSpacing,
        imageOffsetX: CGFloat = ConstantsLayout.DogCardViewLayout.imageOffsetX,
        imageZIndex: CGFloat = ConstantsLayout.DogCardViewLayout.imageZIndex,
        contentOffsetY: CGFloat = ConstantsLayout.DogCardViewLayout.contentOffsetY,
        contentLeftSpace: CGFloat = ConstantsLayout.DogCardViewLayout.contentLeftSpace,
        contentZIndex: CGFloat = ConstantsLayout.DogCardViewLayout.contentZIndex,
        frameHeight: CGFloat = ConstantsLayout.DogCardViewLayout.frameHeight,
        bottomSpace: CGFloat = ConstantsLayout.DogCardViewLayout.bottomSpace
    ) {
        self.dog = dog
        self.stackSpacing = stackSpacing
        self.imageOffsetX = imageOffsetX
        self.imageZIndex = imageZIndex
        self.contentOffsetY = contentOffsetY
        self.contentLeftSpace = contentLeftSpace
        self.contentZIndex = contentZIndex
        self.frameHeight = frameHeight
        self.bottomSpace = bottomSpace
    }

    var body: some View {
        HStack(alignment: .center, spacing: stackSpacing) {
            DogImageView(url: dog.imageURL)
                .offset(x: imageOffsetX)
                .zIndex(imageZIndex)

            DogCardContentView(dog: dog)
                .offset(y: contentOffsetY)
                .padding(.leading, contentLeftSpace)
                .zIndex(contentZIndex)
                .frame(height: frameHeight)
        }
        .frame(height: frameHeight)
        .padding(.bottom, bottomSpace)
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
