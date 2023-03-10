//
//  damealApp.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI
import DamealCore
import DamealMeal
import DamealFavorite

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
