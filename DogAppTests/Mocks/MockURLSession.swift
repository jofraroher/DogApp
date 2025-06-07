//
//  MockURLSession.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import Foundation

@testable import DogApp

final class MockURLSession: URLSessionType {

    var result: Result<(Data, URLResponse), Error>

    init(result: Result<(Data, URLResponse), Error>) {
        self.result = result
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
