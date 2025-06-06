//
//  DogRemoteDataSourceType.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

protocol DogRemoteDataSourceType {
    func fetchDogs() async throws -> [DogDTO]
}
