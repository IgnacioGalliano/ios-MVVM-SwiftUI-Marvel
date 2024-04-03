//
//  MVVMMarvelSwiftUIPerfomanceTests.swift
//  MVVMMarvelSwiftUIUITests
//
//  Created by Nacho on 03/04/2024.
//

import XCTest

final class MVVMMarvelSwiftUIPerfomanceTests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        app = nil
    }

    func testListScrolling() throws {
        measure(metrics: [XCTOSSignpostMetric.scrollingAndDecelerationMetric]) {
            app.swipeUp()
            app.swipeDown()
        }
    }

    // You can measure more complex algorithms within this method
    func testListLoading() throws {
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.swipeUp()
            app.swipeUp()
            app.swipeDown()
            app.swipeDown()
        }
    }
}
