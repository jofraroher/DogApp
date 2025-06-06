//
//  DTOTransformable.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol DTOTransformable {
    
    associatedtype DTOType

    static func fromDTO(_ dto: DTOType) -> Self
    func toDTO() -> DTOType
}
