//
//  TestData.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation

@testable import DogApp

enum TestData {

    static let dog = DogDTO(
        id: "1",
        name: "Luna",
        description: "Friendly and loyal",
        image: "https://example.com/image.jpg",
        age: 3
    )

    static let secondDog = DogDTO(
        id: "2",
        name: "Tobi",
        description: "Playful and energetic",
        image: "https://example.com/rocky.jpg",
        age: 2
    )
}
