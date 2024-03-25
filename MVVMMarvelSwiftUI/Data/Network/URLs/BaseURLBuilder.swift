//
//  BaseURLBuilder.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 25/03/2024.
//

import Foundation

struct URLBuilder {
    static func buildBase() -> String {
        var baseURL: String
        #if STAGING
        baseURL = Constants.localHost
        #elseif RELEASE
        baseURL = Constants.marvelBaseURL
        #elseif DEBUG
        baseURL = Constants.marvelBaseURL
        #endif
        return baseURL + Constants.versionPath
    }

    static func buildCharacterPath() -> String {
        buildBase() + Constants.charactersPath
    }

    struct Constants {
        static let apikey = "apikey"
        static let ts = "ts"
        static let hash = "hash"
        static let versionPath = "/v1"
        static let charactersPath = "/public/characters"
        static let marvelBaseURL = "http://gateway.marvel.com"
        static let localHost = "http://localhost:3000"
    }
}
