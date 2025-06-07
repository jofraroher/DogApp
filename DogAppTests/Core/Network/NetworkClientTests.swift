//
//  NetworkClientTests.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

@testable import DogApp

final class NetworkClientTests: XCTestCase {
    
    func testRequestSuccessfulResponse() async throws {
        // ARRANGE
        let mockData = try JSONEncoder().encode(MockDTO(name: "Tobi"))
        let response = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!
        let sut = makeSUT(result: .success((mockData, response)))
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dog",
            method: .get
        )
        // ACT
        let result: MockDTO = try await sut.client.request(endpoint)
        // ASSERT
        XCTAssertEqual(result, MockDTO(name: "Tobi"))
    }
    
    func testRequestInvalidStatusCode() async {
        // ARRANGE
        let data = Data()
        let response = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )!
        let sut = makeSUT(result: .success((data, response)))
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dog",
            method: .get
        )
        // ACT
        do {
            let _: DummyDecodable = try await sut.client.request(endpoint)
            XCTFail("Expected to throw")
        } catch {
            // ASSERT
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    func testRequestFails() async {
        // ARRANGE
        let sut = makeSUT(result: .failure(URLError(.notConnectedToInternet)))
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dog",
            method: .get
        )
        // ACT
        do {
            let _: DummyDecodable = try await sut.client.request(endpoint)
            XCTFail("Expected to throw")
        } catch {
            // ASSERT
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    func testRequestDecodingError() async {
        // ARRANGE
        let response = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!
        let sut = makeSUT(result: .success((Data(), response)))
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dog",
            method: .get
        )
        // ACT
        do {
            let _: DummyDecodable = try await sut.client.request(endpoint)
            XCTFail("Expected to throw")
        } catch {
            // ASSERT
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    func testRequestEmptyData() async {
        // ARRANGE
        let response = URLResponse(
            url: URL(string: "https://example.com")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        )
        let sut = makeSUT(result: .success((Data(), response)))
        let endpoint = Endpoint(
            baseURL: "https://example.com",
            path: "/dog",
            method: .get
        )
        // ACT
        do {
            let _: DummyDecodable = try await sut.client.request(endpoint)
            XCTFail("Expected to throw")
        } catch {
            // ASSERT
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    private func makeSUT(result: Result<(Data, URLResponse), Error>) -> SutStructure {
        let session = MockURLSession(result: result)
        let client = NetworkClient(session: session)
        
        let sutStructure: SutStructure = SutStructure(
            client: client,
            session: session
        )
        return sutStructure
    }
    
    struct SutStructure {
        let client: NetworkClient
        let session: MockURLSession
    }
}

fileprivate struct DummyDecodable: Decodable { }
