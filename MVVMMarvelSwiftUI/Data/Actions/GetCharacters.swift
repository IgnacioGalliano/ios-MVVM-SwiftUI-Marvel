//
//  GetCharacters.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

protocol GetCharacters {
    func execute(success: @escaping ([CharacterModel]) -> Void,
                 failure: @escaping (GetCharactersError) -> Void)
    func execute() async throws -> [CharacterModel]
}

struct DefaultGetCharacters: GetCharacters {
    private let repository: CharactersRepository

    init(repository: CharactersRepository) {
        self.repository =  repository
    }

    func execute(success: @escaping ([CharacterModel]) -> Void,
                 failure: @escaping (GetCharactersError) -> Void) {
        repository.getCharacters { character in
            success(character)
        } failure: { error in
            failure(error)
        }
    }

    func execute() async throws -> [CharacterModel] {
        try await repository.getCharacters()
    }
}
