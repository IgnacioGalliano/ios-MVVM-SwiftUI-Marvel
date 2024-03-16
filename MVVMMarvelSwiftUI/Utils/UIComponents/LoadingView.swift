//
//  LoadingView.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 06/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.75)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ProgressView()
                    .tint(.gray)
                Text(Localizable.loading)
            }
            .foregroundColor(.black)
            .background {
                RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 200, height: 200)
            }
            .offset(y: -70)
        }
    }
}
