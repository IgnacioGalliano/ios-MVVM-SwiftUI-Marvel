//
//  ActionProvider.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

struct ActionProvider {
    static func getCharacters() -> GetCharacters {
        let repository = DataProvider.shared.getCharactersRepository()
        return DefaultGetCharacters(repository: repository)
    }

    static func getCharacterDetail() -> GetCharacterDetail {
        let repository = DataProvider.shared.getCharactersRepository()
        return DefaultGetCharacterDetail(repository: repository)
    }
}
