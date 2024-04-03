//
//  CharacterDetailView.swift
//  MVVMMarvelSwiftUI
//
//  Created by Ignacio Daniel Galliano on 08/03/2024.
//

import SwiftUI

struct CharacterDetailView<CharacterDetailViewModel>: View where CharacterDetailViewModel: CharacterDetailViewModelable {
    @EnvironmentObject var coordinator: CharactersCoordinator
    @ObservedObject var viewModel: CharacterDetailViewModel

    var body: some View {
        let url = ImageUrlBuilder.build(thumbnail: viewModel.character.thumbnail,
                                        imageType: .standard_xlarge)
        GeometryReader { gp in
            VStack {
                
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, 
                                   maxHeight: gp.size.height * Constants.imageHeightPercent)
                            .clipped()
                    }
                    else {
                        Rectangle()
                            .frame(maxWidth: .infinity,
                                   maxHeight: gp.size.height * Constants.imageHeightPercent)
                            .foregroundColor(.gray)
                    }
                }
                Text(viewModel.character.name)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.top, Constants.textPaddingTop)
                    .padding([.leading, .trailing], Constants.commonPadding)
                    .fontWeight(.semibold)
                    .font(.system(size: Constants.nameFontSize))
                    .accessibilityIdentifier(Constants.characterTitleIdentifier)
                Text(viewModel.character.description)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding([.leading, .trailing], Constants.commonPadding)
                    .accessibilityIdentifier(Constants.characterDescriptionIdentifier)
                Spacer()
            }
            .navigationBarTitle(Localizable.characterDetail, displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                coordinator.popView()
            }){
                Image(systemName: Constants.backButtonSystemName)
                    .foregroundColor(.black)
            })
        }
        .background(Color.white)
    }
}

fileprivate struct Constants {
    static let imageHeightPercent: CGFloat = 0.5
    static let commonPadding: CGFloat = 10
    static let textPaddingTop: CGFloat = 5
    static let nameFontSize: CGFloat = 25
    static let backButtonSystemName: String = "chevron.left"
    static let characterTitleIdentifier: String = "CharacterTitle"
    static let characterDescriptionIdentifier: String = "CharacterDescription"
}


// MARK: - Preview
struct CharacterDetailView_Previews: PreviewProvider {
    @State static var coordinator = CharactersCoordinator()
    static var character = CharacterModel(id: 1,
                                          name: "Bronco",
                                          description: "The best Marvel character",
                                          thumbnail: Thumbnail(path: "",
                                                               imageExtension: ""))
    static var previews: some View {
        CharacterDetailBuilder.build(character: character)
            .environmentObject(coordinator)
    }
}
