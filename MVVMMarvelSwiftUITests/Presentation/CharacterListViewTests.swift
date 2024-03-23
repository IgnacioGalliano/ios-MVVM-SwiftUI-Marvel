//
//  CharacterListViewTests.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 22/03/2024.
//

import XCTest
import SwiftUI
import UIKit
import SnapshotTesting
@testable import MVVMMarvelSwiftUI

class CharacterListViewTests: XCTestCase {
    private var sut: UIViewController!
    private var viewModelSpy: CharacterListViewModelSpy!
    private var coordinatorSpy: CharactersCoordinatorSpy!

    func testCharacterListViewLoading() {
        givenASUT()
        whenTheViewIsLoading()
        // Then assert snapshot
        assertSnapshot(of: sut, as: .image)
    }

    func testCharacterListViewWithTwoCells() {
        givenASUT()
        whenTheViewLoadTwoCells()
        // Then assert snapshot
        assertSnapshot(of: sut, as: .image)
    }

    private func givenASUT() {
        coordinatorSpy = CharactersCoordinatorSpy()
        viewModelSpy = CharacterListViewModelSpy()
        let view = CharacterListView(viewModel: viewModelSpy).environment(coordinatorSpy)
        sut = UIHostingController(rootView: view)
    }

    private func whenTheViewIsLoading() {
        viewModelSpy.stubbedShowLoading = true
    }

    private func whenTheViewLoadTwoCells() {
        let firstCharacter = CharacterModel(id: 1,
                                            name: "Bronco",
                                            description: "The best Marvel character",
                                            thumbnail: Thumbnail(path: "",
                                                                 imageExtension: ""))
        let secondCharacter = CharacterModel(id: 2,
                                             name: "Spiderman",
                                             description: "The second best Marvel character",
                                             thumbnail: Thumbnail(path: "",
                                                                  imageExtension: ""))
        viewModelSpy.stubbedCharacterList = [firstCharacter, secondCharacter]
    }
}
