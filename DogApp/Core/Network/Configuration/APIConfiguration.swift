//
//  APIConfiguration.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

struct APIConfiguration: APIConfigurationType {

    let baseURL: String
    let path: String

    static let `default` = APIConfiguration(
        baseURL: "https://jsonblob.com",
        path: "/api/1151549092634943488"
    )
}
