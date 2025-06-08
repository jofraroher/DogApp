//
//  DogCardContentView.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import SwiftUI

struct DogCardContentView: View {
    
    let dog: Dog
    
    let frameHeight: CGFloat
    let colorOpacity: CGFloat
    let cornerRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    let stackSpacing: CGFloat
    let textLineLimit: Int
    
    init(
        dog: Dog,
        frameHeight: CGFloat = ConstantsLayout.DogCardContentViewLayout.frameHeight,
        colorOpacity: CGFloat = ConstantsLayout.DogCardContentViewLayout.colorOpacity,
        cornerRadius: CGFloat = ConstantsLayout.DogCardContentViewLayout.cornerRadius,
        shadowX: CGFloat = ConstantsLayout.DogCardContentViewLayout.shadowX,
        shadowY: CGFloat = ConstantsLayout.DogCardContentViewLayout.shadowY,
        stackSpacing: CGFloat = ConstantsLayout.DogCardContentViewLayout.stackSpacing,
        textLineLimit: Int = ConstantsLayout.DogCardContentViewLayout.textLineLimit
    ) {
        self.dog = dog
        self.frameHeight = frameHeight
        self.colorOpacity = colorOpacity
        self.cornerRadius = cornerRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
        self.stackSpacing = stackSpacing
        self.textLineLimit = textLineLimit
    }

    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .clipShape(RoundedCornerShape())
                .frame(height: frameHeight)
                .shadow(
                    color: Color.black.opacity(colorOpacity),
                    radius: cornerRadius,
                    x: shadowX,
                    y: shadowY
                )
            

            VStack(alignment: .leading, spacing: stackSpacing) {
                Text(dog.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.textPrimary)

                Text(dog.description)
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(textLineLimit)
                    .truncationMode(.tail)

                Text(Strings.DogCard.dogAgeTitle(dog.age))
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.textPrimary)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DogCardContentView(dog: StubDog.mock)
        .padding()
}
