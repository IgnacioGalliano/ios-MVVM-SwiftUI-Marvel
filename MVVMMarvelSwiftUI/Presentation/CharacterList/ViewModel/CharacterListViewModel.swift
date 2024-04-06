//
//  CharacterListViewModel.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 04/03/2024.
//

import SwiftUI

protocol CharacterListViewModelable: AnyObject, ObservableObject {
    var characterList: [CharacterModel] { get }
    var showLoading: Bool { get }
    var getQuantityOfCharacters: Int { get }

    func loadCharacters()
    func loadCharactersAwait()
}

class CharacterListViewModel: ObservableObject, CharacterListViewModelable {
    @Published var characterList: [CharacterModel] = []
    @Published var showLoading: Bool = false
    private let getCharacters: GetCharactersUseCase

    var getQuantityOfCharacters: Int {
        return characterList.count
    }

    init(getCharacters: GetCharactersUseCase = DefaultGetCharactersUseCase()) {
        self.getCharacters = getCharacters
    }

    func loadCharacters() {
        showLoading = true
        getCharacters.execute { [weak self] characterList in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.characterList = characterList
                self.showLoading = false
            }
        } failure: { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showLoading = false
            }
//            Create error view
        }
    }

    @MainActor
    func loadCharactersAwait() {
        Task{
            showLoading = true
            do {
                let characters = try await getCharacters.execute()
                showLoading = false
                self.characterList = characters
            } catch let error {
                showLoading = false
//            Create error view
            }
        }
    }
}
