//
//  CharactersCoordinatorSpy.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 23/03/2024.
//

@testable import MVVMMarvelSwiftUI
import SwiftUI

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
