//
//  GetCharactersUseCase.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 06/04/2024.
//

import Foundation

protocol GetCharactersUseCase {
    func execute(success: @escaping ([CharacterModel]) -> Void,
                 failure: @escaping (GetCharactersError) -> Void)
    func execute() async throws -> [CharacterModel]
}

struct DefaultGetCharactersUseCase: GetCharactersUseCase {
    private let repository: CharactersRepository

    init(repository: CharactersRepository = DataProvider.shared.getCharactersRepository()) {
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
