//
//  DogDTO.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

struct DogDTO {
    
    let id: String
    let name: String
    let description: String
    let image: String
    let age: Int
}

extension DogDTO: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "dogName"
        case description
        case image
        case age
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.image = try container.decode(String.self, forKey: .image)
        self.age = try container.decode(Int.self, forKey: .age)

        self.id = UUID().uuidString
    }

    func toDomain() -> Dog {
        Dog(id: id, name: name, description: description, image: image, age: age)
    }
}
