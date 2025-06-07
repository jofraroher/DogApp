//
//  DogViewModel.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

struct DogViewModel: Identifiable, Equatable {
    let id: String
    let name: String
    let description: String
    let imageURL: URL?
    let age: Int
}
