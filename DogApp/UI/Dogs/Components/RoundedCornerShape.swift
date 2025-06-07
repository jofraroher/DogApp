//
//  RoundedCornerShape.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    
    let radius: CGFloat
    let corners: UIRectCorner
    
    init(
        radius: CGFloat = ConstantsLayout.RoundedCornerLayout.cornerRadius,
        corners: UIRectCorner = [.topRight, .bottomRight]
    ) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
