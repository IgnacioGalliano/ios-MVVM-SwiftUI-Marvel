//
//  MarverDBManager.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 14/03/2024.
//

import Foundation

struct MarverDBManager {
    static var publicKey: String = {
        guard let filePath = Bundle.main.path(forResource: "MarvelMovieDB-info", ofType: "plist") else {
            fatalError("Couldn't find file 'MarvelMovieDB-Info.plist'.")
        }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "PUBLIC_KEY") as? String else {
            fatalError("Couldn't find key 'PUBLIC_KEY' in 'MarvelMovieDB-Info.plist'.")
        }
        return value
    }()

    static var privateKey: String = {
        guard let filePath = Bundle.main.path(forResource: "MarvelMovieDB-info", ofType: "plist") else {
            fatalError("Couldn't find file 'MarvelMovieDB-Info.plist'.")
        }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "PRIVATE_KEY") as? String else {
          fatalError("Couldn't find key 'PRIVATE_KEY' in 'MarvelMovieDB-Info.plist'.")
        }
        return value
    }()
}
