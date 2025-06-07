//
//  DogEntity.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation
import SwiftData

@Model
final class DogEntity {
    
    @Attribute(.unique) var id: String
    var name: String
    var dogDescription: String
    var image: String
    var age: Int

    init(id: String, name: String, dogDescription: String, image: String, age: Int) {
        self.id = id
        self.name = name
        self.dogDescription = dogDescription
        self.image = image
        self.age = age
    }
}

extension DogEntity: DTOTransformable {
    
    typealias DTOType = DogDTO

    static func fromDTO(_ dto: DogDTO) -> DogEntity {
        .init(id: dto.id, name: dto.name, dogDescription: dto.description, image: dto.image, age: dto.age)
    }

    func toDTO() -> DogDTO {
        .init(id: id, name: name, description: dogDescription, image: image, age: age)
    }
}
