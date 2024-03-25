//
//  CharactersCoordinator.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 04/03/2024.
//

import SwiftUI

protocol CharactersCoordinatable: ObservableObject {
    func goToDetail(character: CharacterModel)
    func popView()
    func showPopUp()
}

class CharactersCoordinator: ObservableObject, CharactersCoordinatable {
    @Published var path = NavigationPath()
    @Published var page: CharacterPages = .characterList
    @Published var sheet: Sheet?
    @Published var characterSelected: CharacterModel?

    func goToDetail(character: CharacterModel) {
        characterSelected = character
        path.append(CharacterPages.characterDetail)
    }

    func showPopUp() {
        sheet = .popup
    }

    func popView() {
        path.removeLast()
    }

    // MARK: - View provider

    @ViewBuilder
    func getPage(_ newPage: CharacterPages) -> some View {
        switch newPage {
        case .characterList:
            CharacterListBuilder.build()
        case .characterDetail:
            CharacterDetailBuilder.build(character: characterSelected!)
        }
    }

    // MARK: - Sheet provider
    @ViewBuilder
    func getSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .popup:
            CharacterListBuilder.build()
        }
    }
}

enum CharacterPages: String, CaseIterable, Identifiable {
    case characterList
    case characterDetail

    var id: String { self.rawValue }
}

enum Sheet: String, CaseIterable, Identifiable {
    case popup

    var id: String { self.rawValue }
}
