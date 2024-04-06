//
//  CharacterListView.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 04/03/2024.
//

import SwiftUI

protocol CharacterListDelegate {
    func rowTapped(character: CharacterModel)
}

struct CharacterListView<CharacterListViewModel>: View where CharacterListViewModel: CharacterListViewModelable {
    @ObservedObject var viewModel: CharacterListViewModel
    @EnvironmentObject var coordinator: CharactersCoordinator

    var body: some View {
        NavigationStack() {
            if viewModel.showLoading {
                LoadingView()
            } else {
                List(viewModel.characterList, id: \.id) { item in
                    CharacterRow(character: item,
                                 delegate: self)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: Constants.rowTopInsets,
                                         leading: Constants.rowSideInsets, 
                                         bottom: Constants.rowBottomInsets,
                                         trailing: Constants.rowSideInsets))
                    .listRowBackground(Color.white)
                    .accessibilityIdentifier(Constants.characterCellIdentifier)
                }
                .frame(maxWidth: .infinity)
                .listStyle(PlainListStyle())
                .navigationBarTitle(Localizable.characterList, displayMode: .inline)
                .accessibilityIdentifier(Constants.characterListIdentifier)
            }
        }
        .background(Color.white)
        .onAppear {
            viewModel.loadCharactersAwait()
        }
        .background(Color.white)
    }
}

fileprivate struct Constants {
    static let rowSideInsets: CGFloat = 10
    static let rowTopInsets: CGFloat = 10
    static let rowBottomInsets: CGFloat = 10
    static let characterListIdentifier: String = "CharacterList"
    static let characterCellIdentifier: String = "CharacterCell"
}

// MARK: - Row Delegate
extension CharacterListView: CharacterListDelegate {
    func rowTapped(character: CharacterModel) {
        DispatchQueue.main.async {
            coordinator.goToDetail(character: character)
        }
    }
}


// MARK: - Preview
struct CharacterListView_Previews: PreviewProvider {
    @State static var coordinator = CharactersCoordinator()
    static var previews: some View {
        CharacterListBuilder.build()
            .environmentObject(coordinator)
    }
}
