//
//  GetCharactersSpy.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 23/03/2024.
//

import Foundation
@testable import MVVMMarvelSwiftUI

class GetCharactersSpy: GetCharactersUseCase {
    var invokedExecuteSuccess = false
    var invokedExecuteSuccessCount = 0
    var stubbedExecuteSuccessSuccessResult: ([CharacterModel], Void)?
    var stubbedExecuteSuccessFailureResult: (GetCharactersError, Void)?

    func execute(success: @escaping ([CharacterModel]) -> Void,
        failure: @escaping (GetCharactersError) -> Void) {
        invokedExecuteSuccess = true
        invokedExecuteSuccessCount += 1
        if let result = stubbedExecuteSuccessSuccessResult {
            success(result.0)
        }
        if let result = stubbedExecuteSuccessFailureResult {
            failure(result.0)
        }
    }

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteSuccessResult: [CharacterModel]!
    var stubbedExecuteFailureResult: NSError?

    func execute() async throws -> [MVVMMarvelSwiftUI.CharacterModel] {
        invokedExecute = true
        invokedExecuteCount += 1
        if let stubbedExecuteFailureResult = stubbedExecuteFailureResult {
            throw stubbedExecuteFailureResult
        }
        return stubbedExecuteSuccessResult
    }
}
