//
//  Endpoint.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

struct Endpoint {

    let baseURL: String
    let path: String
    let method: HTTPMethod
    let headers: [String: String]
    let queryItems: [URLQueryItem]?
    let body: Data?

    init(
        baseURL: String,
        path: String = "",
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        queryItems: [URLQueryItem]? = nil,
        body: Data? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.body = body
    }

    func urlRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            throw NetworkError.badURL
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw NetworkError.badURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        return request
    }
}
