//
//  MainPage.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 09/03/2024.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var coordinator: CharactersCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(CharacterPages.characterList)
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.getSheet(sheet: sheet)
                }
                .navigationDestination(for: CharacterPages.self) { page in
                    coordinator.getPage(page)
                }
                .onOpenURL { url in
                    print("Some code for handling")
                }
        }
        .navigationBarTitleTextColor(.black)
    }
}

struct MainPage_Previews: PreviewProvider {
    @State static var coordinator = CharactersCoordinator()
    static var previews: some View {
        MainPage()
            .environmentObject(coordinator)
    }
}
