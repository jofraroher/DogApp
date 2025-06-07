//
//  Dog+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
import Foundation

extension Dog {
    static var mock: Dog {
        Dog(
            id: "1",
            name: "Chief",
            description: "Loyal and brave",
            image: "https://example.com/chief.jpg",
            age: 4
        )
    }

    static var mockLongDescription: Dog {
        Dog(
            id: "2",
            name: "Boss",
            description: String(repeating: "Very loyal. ", count: 8),
            image: "https://example.com/boss.jpg",
            age: 5
        )
    }
}
#endif
