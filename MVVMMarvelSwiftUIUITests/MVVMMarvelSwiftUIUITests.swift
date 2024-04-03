///
//  MVVMMarvelSwiftUIUITests.swift
//  MVVMMarvelSwiftUIUITests
//
//  Created by Nacho on 03/03/2024.
//

import XCTest

final class MVVMMarvelSwiftUIUITests: XCTestCase {
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

    func testCharacterLists() throws {
        let characterList = app.collectionViews["CharacterList"]
        let firstCell = characterList.children(matching: .cell).element(boundBy: 0)
        let secondCell = characterList.children(matching: .cell).element(boundBy: 1)
        let thirdCell = characterList.children(matching: .cell).element(boundBy: 2)
        let fourthCell = characterList.children(matching: .cell).element(boundBy: 3)
        let fifthCell = characterList.children(matching: .cell).element(boundBy: 4)
        let sixthCell = characterList.children(matching: .cell).element(boundBy: 5)

        let firstTitleCell = firstCell.staticTexts["3-D Man"].firstMatch
        let secondTitleCell = secondCell.staticTexts["A-Bomb (HAS)"].firstMatch
        let thirdTitleCell = thirdCell.staticTexts["A.I.M."].firstMatch
        let fourthTitleCell = fourthCell.staticTexts["Aaron Stack"].firstMatch
        let fifthTitleCell = fifthCell.staticTexts["Abomination (Emil Blonsky)"].firstMatch
        let sixthTitleCell = sixthCell.staticTexts["Abomination (Ultimate)"].firstMatch

        XCTAssertEqual(6, characterList.cells.count, "Number of cells failure, try using an iPhone 15 and the mock server")
        XCTAssert(firstTitleCell.exists)
        XCTAssert(secondTitleCell.exists)
        XCTAssert(thirdTitleCell.exists)
        XCTAssert(fourthTitleCell.exists)
        XCTAssert(fifthTitleCell.exists)
        XCTAssert(sixthTitleCell.exists)
    }

    func testCharacterDetail() throws {
        let characterList = app.collectionViews["CharacterList"]
        let thirdCell = characterList.children(matching: .cell).element(boundBy: 2)

        XCTAssert(thirdCell.exists)

        thirdCell.tap()
        let title = app.staticTexts["A.I.M."].firstMatch
        let description = app.staticTexts["AIM is a terrorist organization bent on destroying the world."].firstMatch

        XCTAssert(title.exists)
        XCTAssert(description.exists)
    }
}
