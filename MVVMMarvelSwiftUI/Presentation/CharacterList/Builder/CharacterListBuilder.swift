//
//  CharacterListBuilder.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 04/03/2024.
//

import SwiftUI

struct CharacterListBuilder {
    static func build() -> some View {
        let viewModel = CharacterListViewModel()
        let view = CharacterListView(viewModel: viewModel)

        return view
    }
}
