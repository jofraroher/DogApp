//
//  ConstantsLayout.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation
import SwiftUI

enum ConstantsLayout {
    
    enum ErrorViewLayout {
        static let stackSpacing: CGFloat = 12
    }
    
    enum RoundedCornerLayout {
        static let cornerRadius: CGFloat = 10
    }
    
    enum DogCardContentViewLayout {
        static let frameHeight: CGFloat = 170
        static let colorOpacity: CGFloat = 0.12
        static let cornerRadius: CGFloat = 6
        static let shadowX: CGFloat = 0
        static let shadowY: CGFloat = 3
        static let stackSpacing: CGFloat = 20
        static let textLineLimit: Int = 2
    }
    
    enum DogCardViewLayout {
        static let stackSpacing: CGFloat = 0
        static let imageOffsetX: CGFloat = 6
        static let imageZIndex: CGFloat = 1
        static let contentOffsetY: CGFloat = 12
        static let contentLeftSpace: CGFloat = 6
        static let contentZIndex: CGFloat = 0
        static let frameHeight: CGFloat = 200
        static let bottomSpace: CGFloat = 16
    }
    
    enum DogImageViewLayout {
        static let errorImageName: String = "photo.badge.exclamationmark.fill"
        static let errorImageSize: CGFloat = 40
        static let size: CGSize = CGSize(width: 130, height: 200)
        static let backgroundColor: Color = Color.gray.opacity(0.2)
        static let cornerRadius: CGFloat = 10
        static let shadowColor: Color = Color.black.opacity(0.06)
        static let shadowRadius: CGFloat = 3
        static let shadowX: CGFloat = 0
        static let shadowY: CGFloat = 2
    }
    
    enum DogListLayout {
        static let stackSpacing: CGFloat = 16
    }
}
