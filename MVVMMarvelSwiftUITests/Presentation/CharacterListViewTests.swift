//
//  CharacterListViewTests.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 22/03/2024.
//

import Foundation
import XCTest
@testable import MVVMMarvelSwiftUI
import SwiftUI

class CharacterListViewTests: XCTestCase {
    private var sut: (any View)!
    private var viewModelSpy: CharacterListViewModelSpy!
    private var coordinatorSpy: CharactersCoordinatorSpy!

    func testCharacterListViewLoading() {
        givenASUT()
    }

    func givenASUT() {
        coordinatorSpy = CharactersCoordinatorSpy()
        viewModelSpy = CharacterListViewModelSpy()
        sut = CharacterListView(viewModel: viewModelSpy).environment(coordinatorSpy)
    }
}

class CharactersCoordinatorSpy: CharactersCoordinatable, Observable {
    var invokedGoToDetail = false
    var invokedGoToDetailCount = 0
    var invokedGoToDetailParameters: (character: CharacterModel, Void)?
    var invokedGoToDetailParametersList = [(character: CharacterModel, Void)]()

    func goToDetail(character: CharacterModel) {
        invokedGoToDetail = true
        invokedGoToDetailCount += 1
        invokedGoToDetailParameters = (character, ())
        invokedGoToDetailParametersList.append((character, ()))
    }

    var invokedPopView = false
    var invokedPopViewCount = 0

    func popView() {
        invokedPopView = true
        invokedPopViewCount += 1
    }

    var invokedShowPopUp = false
    var invokedShowPopUpCount = 0

    func showPopUp() {
        invokedShowPopUp = true
        invokedShowPopUpCount += 1
    }
}

class CharacterListViewModelSpy: CharacterListViewModelable {
    var invokedCharacterListGetter = false
    var invokedCharacterListGetterCount = 0
    var stubbedCharacterList: [CharacterModel]! = []

    var characterList: [CharacterModel] {
        invokedCharacterListGetter = true
        invokedCharacterListGetterCount += 1
        return stubbedCharacterList
    }

    var invokedShowLoadingGetter = false
    var invokedShowLoadingGetterCount = 0
    var stubbedShowLoading: Bool! = false

    var showLoading: Bool {
        invokedShowLoadingGetter = true
        invokedShowLoadingGetterCount += 1
        return stubbedShowLoading
    }

    var invokedGetQuantityOfCharactersGetter = false
    var invokedGetQuantityOfCharactersGetterCount = 0
    var stubbedGetQuantityOfCharacters: Int! = 0

    var getQuantityOfCharacters: Int {
        invokedGetQuantityOfCharactersGetter = true
        invokedGetQuantityOfCharactersGetterCount += 1
        return stubbedGetQuantityOfCharacters
    }

    var invokedLoadCharacters = false
    var invokedLoadCharactersCount = 0

    func loadCharacters() {
        invokedLoadCharacters = true
        invokedLoadCharactersCount += 1
    }

    var invokedLoadCharactersAwait = false
    var invokedLoadCharactersAwaitCount = 0

    func loadCharactersAwait() {
        invokedLoadCharactersAwait = true
        invokedLoadCharactersAwaitCount += 1
    }
}
