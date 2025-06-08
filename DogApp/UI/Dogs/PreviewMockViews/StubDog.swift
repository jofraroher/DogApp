//
//  DogViewModel+Mock.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

#if DEBUG
enum StubDog {
    
    static var mock: Dog {
        Dog(
            id: "1",
            name: "Chief",
            description: "Loyal and brave",
            image: "",
            age: 2
        )
    }
    
    static var mockLongDescription: Dog {
        Dog(
            id: "2",
            name: "Boss",
            description: String(repeating: "Very loyal. ", count: 8),
            image: "",
            age: 5
        )
    }
}
#endif
