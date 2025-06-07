//
//  DogViewModel+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
import Foundation

extension DogViewModel {
    static var mock: DogViewModel {
        DogViewModel(
            id: "1",
            name: "Chief",
            description: "Loyal and brave",
            imageURL: nil,
            age: 2
        )
    }
    
    static var mockLongDescription: DogViewModel {
        DogViewModel(
            id: "2",
            name: "Boss",
            description: String(repeating: "Very loyal. ", count: 8),
            imageURL: nil,
            age: 5
        )
    }
}
#endif
