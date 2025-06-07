//
//  DogViewModelMapper.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

struct DogViewModelMapper {
    static func map(from domain: Dog) -> DogViewModel {
        DogViewModel(
            id: domain.id,
            name: domain.name.capitalized,
            description: domain.description,
            imageURL: URL(string: domain.image) ?? URL(string: "")!,
            age: domain.age
        )
    }

    static func map(from domainList: [Dog]) -> [DogViewModel] {
        domainList.map { map(from: $0) }
    }
}
