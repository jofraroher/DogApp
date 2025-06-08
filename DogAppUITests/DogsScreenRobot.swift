//
//  DogsScreenRobot.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 07/06/25.
//

import XCTest

final class DogsListRobot {
    
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func launch(withArguments arguments: [String]) {
        app.launchArguments = arguments
        app.launch()
    }

    func assertDogCardVisible(id: String, file: StaticString = #file, line: UInt = #line) {
        let card = app.descendants(matching: .any)["DogCardView\(id)"]
        XCTAssertTrue(card.waitForExistence(timeout: 2), "Expected DogCardView\(id) to be visible", file: file, line: line)
    }

    func assertEmptyStateVisible(file: StaticString = #file, line: UInt = #line) {
        let emptyLabel = app.staticTexts["emptyStateLabel"]
        XCTAssertTrue(emptyLabel.waitForExistence(timeout: 2), "Expected empty state to be visible", file: file, line: line)
    }

    func assertRetryButtonVisible(file: StaticString = #file, line: UInt = #line) {
        let retryButton = app.buttons["retryButton"]
        XCTAssertTrue(retryButton.waitForExistence(timeout: 2), "Expected retry button to be visible", file: file, line: line)
    }

    func assertListIsVisible(file: StaticString = #file, line: UInt = #line) {
        let list = app.otherElements["dogsList"]
        XCTAssertTrue(list.waitForExistence(timeout: 2), "Expected dog list to be visible", file: file, line: line)
    }
}
