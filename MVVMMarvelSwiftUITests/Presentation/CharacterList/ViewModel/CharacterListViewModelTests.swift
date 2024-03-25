//
//  CharacterListViewModelTests.swift
//  MVVMMarvelSwiftUITests
//
//  Created by Nacho on 23/03/2024.
//

import XCTest
@testable import MVVMMarvelSwiftUI


class CharacterListViewModelTests: XCTestCase {
    private var sut: CharacterListViewModel!
    private var getCharacterSpy: GetCharactersSpy!

    func testLoadCharactersAwait() async {
        givenASUT()
        await whenLoadCharactersAwaitIsExecuted()
        await thenAssertLoadCharactersAwaitLoad()
    }

    private func givenASUT() {
        getCharacterSpy = GetCharactersSpy()
        sut = CharacterListViewModel(getCharacters: getCharacterSpy)
    }

    private func whenLoadCharactersAwaitIsExecuted() async {
        let firstCharacter = CharacterModel(id: 1,
                                            name: "Bronco",
                                            description: "The best Marvel character",
                                            thumbnail: Thumbnail(path: "",
                                                                 imageExtension: ""))
        let secondCharacter = CharacterModel(id: 2,
                                             name: "Spiderman",
                                             description: "The second best Marvel character",
                                             thumbnail: Thumbnail(path: "",
                                                                  imageExtension: ""))
        getCharacterSpy.stubbedExecuteSuccessResult = [firstCharacter, secondCharacter]
        await sut.loadCharactersAwait()
    }

    private func thenAssertLoadCharactersAwaitLoad() async {
        try! await Task.sleep(for: .seconds(0.1))
        XCTAssertTrue(getCharacterSpy.invokedExecute)
        XCTAssertEqual(getCharacterSpy.invokedExecuteCount, 1)
        XCTAssertEqual(sut.getQuantityOfCharacters, 2)
        XCTAssertEqual(sut.characterList.first?.id, 1)
        XCTAssertEqual(sut.characterList.first?.name, "Bronco")
        XCTAssertEqual(sut.characterList.first?.description, "The best Marvel character")
    }
}
