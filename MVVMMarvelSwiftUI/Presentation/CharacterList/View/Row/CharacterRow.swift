//
//  CharacterRow.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 07/03/2024.
//

import SwiftUI

struct CharacterRow: View {
    private let character: CharacterModel
    private let delegate: CharacterListDelegate

    init(character: CharacterModel, 
         delegate: CharacterListDelegate) {
        self.character = character
        self.delegate = delegate
    }

    var body: some View {
        HStack(alignment: .top) {
            let url = ImageUrlBuilder.build(thumbnail: character.thumbnail,
                                            imageType: .standard_xlarge)
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.imageDimensions, height: Constants.imageDimensions)
                        .cornerRadius(Constants.commonRadius)
                }
                else {
                    Rectangle()
                        .frame(width: Constants.imageDimensions, height: Constants.imageDimensions)
                        .cornerRadius(Constants.commonRadius)
                        .foregroundColor(.gray)
                }
            }
            Text(character.name)
                .foregroundColor(.black)
                .font(.callout)
                .lineLimit(Constants.nameMaxeLines)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.top, Constants.commonPadding)

        }
        .frame(height: Constants.rowHeight, alignment: .top)
        .frame(maxWidth: .infinity)
        .padding([.leading, .top], Constants.commonPadding)
        .background(Rectangle().fill(Color.white))
        .foregroundColor(.white)
        .cornerRadius(Constants.commonRadius)
        .shadow(color: .gray, 
                radius: Constants.shadowRadius,
                x: Constants.shadowXRadius,
                y: Constants.shadowYRadius)
        .onTapGesture {
            delegate.rowTapped(character: character)
        }
    }
}

fileprivate struct Constants {
    static let imageDimensions: CGFloat = 70
    static let commonRadius: CGFloat = 10
    static let commonPadding: CGFloat = 10
    static let rowHeight: CGFloat = 100
    static let nameMaxeLines: Int = 1
    static let shadowRadius: CGFloat = 3
    static let shadowXRadius: CGFloat = 2
    static let shadowYRadius: CGFloat = 2
}
