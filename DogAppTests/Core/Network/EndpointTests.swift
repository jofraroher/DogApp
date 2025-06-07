//
//  EndpointTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class EndpointTests: XCTestCase {
    
    func testURLRequestSuccess() throws {
        // ARRANGE
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dogs",
            method: .get,
            headers: ["test": "test"]
        )
        // ACT
        let request = try endpoint.urlRequest()
        // ASSERT
        XCTAssertEqual(request.url?.absoluteString, "https://example.com/dogs")
        XCTAssertEqual(request.httpMethod, "GET")
    }
    
    func testURLRequestFailure() {
        // ARRANGE
        let endpoint = Endpoint(
            baseURL: "htt ps://example.com",
            path: "/dogs",
            method: .get
        )
        // ACT / ASSERT
        XCTAssertThrowsError(try endpoint.urlRequest()) { error in
            XCTAssertTrue(error is NetworkError)
        }
    }
}
