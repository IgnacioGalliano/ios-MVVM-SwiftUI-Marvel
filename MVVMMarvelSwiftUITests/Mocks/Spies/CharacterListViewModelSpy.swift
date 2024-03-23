//
//  CharacterListViewModelSpy.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 23/03/2024.
//

@testable import MVVMMarvelSwiftUI
import SwiftUI

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
