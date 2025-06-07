//
//  NetworkErrorTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class NetworkErrorTests: XCTestCase {
    
    func testBadURLErrorDescription() {
        // ARRANGE / ACT
        let error = NetworkError.badURL
        // ASSERT
        XCTAssertEqual(error.errorDescription, String(localized: Strings.NetworkError.badURL))
    }

    func testDecodingErrorDescription() {
        // ARRANGE / ACT
        let underlying = NSError(domain: "Decoding", code: 100, userInfo: [NSLocalizedDescriptionKey: "Invalid format"])
        let error = NetworkError.decodingError(underlying)
        let expected = String(localized: Strings.NetworkError.decodingError("Invalid format"))
        // ASSERT
        XCTAssertEqual(error.errorDescription, expected)
    }

    func testRequestFailedDescription() {
        // ARRANGE / ACT
        let underlying = NSError(domain: "Request", code: 200, userInfo: [NSLocalizedDescriptionKey: "Timeout"])
        let error = NetworkError.requestFailed(underlying)
        let expected = String(localized: Strings.NetworkError.requestFailed("Timeout"))
        // ASSERT
        XCTAssertEqual(error.errorDescription, expected)
    }

    func testInvalidStatusCodeDescription() {
        // ARRANGE / ACT
        let code = 404
        let error = NetworkError.invalidStatusCode(code)
        let expected = String(localized: Strings.NetworkError.invalidStatusCode(code))
        // ASSERT
        XCTAssertEqual(error.errorDescription, expected)
    }

    func testNoDataErrorDescription() {
        // ARRANGE / ACT
        let error = NetworkError.noData
        // ASSERT
        XCTAssertEqual(error.errorDescription, String(localized: Strings.NetworkError.noData))
    }
}
