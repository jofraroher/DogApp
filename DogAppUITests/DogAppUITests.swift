//
//  DogAppUITests.swift
//  DogAppUITests
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import XCTest

final class DogAppUITests: XCTestCase {

    private var app: XCUIApplication!
    private var robot: DogsListRobot!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        robot = DogsListRobot(app: app)
    }

    func test_loadingState_showsCard() {
        // ARRANGE & ACT
        robot.launch(withArguments: ["-UITEST_SUCCESS_STATE"])

        // ASSERT
        robot.assertListIsVisible()
        robot.assertDogCardVisible(id: "1") // opcional: validar una card específica
    }

    func test_emptyState_showsPlaceholder() {
        robot.launch(withArguments: ["-UITEST_EMPTY_STATE"])
        robot.assertEmptyStateVisible()
    }

    func test_errorState_showsRetry() {
        robot.launch(withArguments: ["-UITEST_ERROR_STATE"])
        robot.assertRetryButtonVisible()
    }
}
