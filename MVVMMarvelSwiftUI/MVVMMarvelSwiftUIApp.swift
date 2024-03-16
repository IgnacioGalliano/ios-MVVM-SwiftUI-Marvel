//
//  MVVMMarvelSwiftUIApp.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 03/03/2024.
//

import SwiftUI

@main
struct MVVMMarvelSwiftUIApp: App {
    @State var coordinator = CharactersCoordinator()
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environmentObject(coordinator)
        }
    }
}
