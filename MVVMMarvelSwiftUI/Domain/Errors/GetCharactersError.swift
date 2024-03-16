//
//  GetCharactersError.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

enum GetCharactersError: Error {
    case generic(message: String)
    case foundNil
}
