//
// awesome_swiftuiUITestsLaunchTests.swift
// awesome-swiftuiUITests
//
// Created by Huy D. on 1/5/23
// mjn2max.github.io 😜
// 
// Copyright © 2023. All rights reserved.
// mjn2max.com
//

import XCTest

final class awesome_swiftuiUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
