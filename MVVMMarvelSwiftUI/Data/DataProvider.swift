//
//  DataProvider.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

class DataProvider {
    static let shared = DataProvider()

    private lazy var charactersRepository: DefaultCharacters = {
        return DefaultCharacters(configNetworkService: getCharactersNetworkService())
    }()

    func getCharactersNetworkService() -> DefaultGetCharactersNetworkService {
        DefaultGetCharactersNetworkService()
    }

    func getCharactersRepository() -> CharactersRepository {
        return charactersRepository
    }
}
