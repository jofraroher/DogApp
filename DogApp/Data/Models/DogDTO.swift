//
//  DogDTO.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

struct DogDTO: Decodable {
    
    let id: String
    let name: String
    let description: String
    let image: String

    func toDomain() -> Dog {
        Dog(id: id, name: name, description: description, image: image)
    }
}
