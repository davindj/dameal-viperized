//
//  HomeView.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter

    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.meals.isEmpty || true {
                emptyMeals
            } else {
                content
            }
        }.onAppear {
            if self.presenter.meals.isEmpty {
                self.presenter.getMeals()
            }
        }.navigationBarTitle(
            Text("Home"),
            displayMode: .automatic
        )
    }
}

extension HomeView {
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
            image: "no-results",
            title: "The meal is empty"
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
                        Text(meal.title)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
            }
        }
    }

}
