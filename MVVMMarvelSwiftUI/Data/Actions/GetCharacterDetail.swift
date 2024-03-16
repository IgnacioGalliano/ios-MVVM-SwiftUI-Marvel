//
//  GetCharacterDetail.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

protocol GetCharacterDetail {
    func execute(id: String,
                 success: @escaping (CharacterModel) -> Void,
                 failure: @escaping (GetCharactersError) -> Void)
}

struct DefaultGetCharacterDetail: GetCharacterDetail {
    private let repository: CharactersRepository

    init(repository: CharactersRepository) {
        self.repository =  repository
    }

    func execute(id: String,
                 success: @escaping (CharacterModel) -> Void,
                 failure: @escaping (GetCharactersError) -> Void) {
    }
}
