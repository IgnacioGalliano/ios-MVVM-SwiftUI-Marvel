//
//  ImageUrlBuilder.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 06/03/2024.
//

import Foundation

class ImageUrlBuilder {
    static func build(thumbnail: Thumbnail, imageType: ImageType) -> URL {
        let url = thumbnail.path + "/" + imageType.rawValue + "." + thumbnail.imageExtension
        return URL(string: url)!
    }

    enum ImageType: String {
        case standard_xlarge
        case standard_fantastic
        case standard_amazing
    }
}
