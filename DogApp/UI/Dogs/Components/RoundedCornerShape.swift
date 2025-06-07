//
//  RoundedCornerShape.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    
    var radius: CGFloat = 10
    var corners: UIRectCorner = [.topRight, .bottomRight]

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
