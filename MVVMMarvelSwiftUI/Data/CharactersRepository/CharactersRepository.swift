//
//  CharactersRepository.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

protocol CharactersRepository {
    func getCharacters(success: @escaping ([CharacterModel]) -> Void,
                       failure: @escaping (GetCharactersError) -> Void)
    func getCharacters() async throws -> [CharacterModel]
}

class DefaultCharacters: CharactersRepository {
    private let configNetworkService: GetCharactersNetworkService
    private var character: [CharacterModel] = []

    init(configNetworkService: GetCharactersNetworkService) {
        self.configNetworkService = configNetworkService
    }

    func getCharacters(success: @escaping ([CharacterModel]) -> Void,
                       failure: @escaping (GetCharactersError) -> Void) {
        guard character.isEmpty else {
            success(character)
            return
        }

        fetchCharacters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let responseDTO):
                self.character = responseDTO.data.results.compactMap({ $0.toCharacterModel() })
                success(self.character)
            case .failure(let error):
                failure(error)
            }
        }
    }

    private func fetchCharacters(completion: @escaping (Result<ResponseListDTO, GetCharactersError>)  -> Void) {
        configNetworkService.execute() { result in
            completion(result)
        }
    }

    func getCharacters() async throws -> [CharacterModel] {
        guard character.isEmpty else {
            return character
        }

        let responseDTO = try await configNetworkService.execute()
        character = responseDTO.data.results.compactMap({ $0.toCharacterModel() })
        return character
    }
}

