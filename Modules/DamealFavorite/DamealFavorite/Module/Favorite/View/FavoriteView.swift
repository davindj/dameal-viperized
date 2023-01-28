//
//  FavoriteView.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import SwiftUI
import DamealCore
import DamealMeal

public struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter

    public init(presenter: FavoritePresenter) {
        self.presenter = presenter
    }

    public var body: some View {
        ZStack {
            AppBackground()
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.meals.isEmpty {
                emptyMeals
            } else {
                content
            }
        }.onAppear {
            self.presenter.getFavoriteMeals()
        }.navigationBarTitle(
            Text("Favorite"),
            displayMode: .automatic
        )
    }
}

extension FavoriteView {
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }

    var errorIndicator: some View {
        CustomEmptyView(
            image: "error",
            title: presenter.errorMessage
        )
    }

    var emptyMeals: some View {
        CustomEmptyView(
            image: "favorite",
            title: "No Favorites yet! Time to add some"
        )
    }

    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(
                self.presenter.meals,
                id: \.id
            ) { meal in
                ZStack {
                    self.presenter.linkBuilder(for: meal) {
                        MealRow(meal: meal)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
            }
        }
    }

}
