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

    init(id: String, name: String, dogDescription: String, image: String) {
        self.id = id
        self.name = name
        self.dogDescription = dogDescription
        self.image = image
    }
}

extension DogEntity: DTOTransformable {
    
    typealias DTOType = DogDTO

    static func fromDTO(_ dto: DogDTO) -> DogEntity {
        .init(id: dto.id, name: dto.name, dogDescription: dto.description, image: dto.image)
    }

    func toDTO() -> DogDTO {
        .init(id: id, name: name, description: dogDescription, image: image)
    }
}
