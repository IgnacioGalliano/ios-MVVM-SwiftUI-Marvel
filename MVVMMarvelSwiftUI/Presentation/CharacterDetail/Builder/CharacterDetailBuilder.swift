//
//  CharacterDetailBuilder.swift
//  MVVMMarvelSwiftUI
//
//  Created by Ignacio Daniel Galliano on 08/03/2024.
//

import SwiftUI

class CharacterDetailBuilder {
    static func build(character: CharacterModel) -> some View {
        let viewModel = CharacterDetailViewModel(character: character)
        let view = CharacterDetailView(viewModel: viewModel)

        return view
    }
}
