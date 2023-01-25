//
//  damealApp.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

@main
struct DamealApp: App {
    var body: some Scene {
        let homeUseCase = Injection.provideHomeUseCase()
        let favoriteUseCase = Injection.provideFavoriteUseCase()

        return WindowGroup {
            ContentView()
                .environmentObject(
                    HomePresenter(homeUseCase: homeUseCase)
                )
                .environmentObject(
                    FavoritePresenter(favoriteUseCase: favoriteUseCase)
                )
        }
    }
}
