//
//  DetailView.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter

    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                content
            }
        }.onAppear {
            self.presenter.getMeal()
        }.navigationBarTitle(
            Text(presenter.meal.title),
            displayMode: .automatic
        )
    }
}

extension DetailView {
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
            title: "Meal not found"
        )
    }

    var content: some View {
        let meal = presenter.meal

        return ScrollView(.vertical, showsIndicators: false) {
            Text(meal.title)
            Text(meal.id)
            Text(meal.category)
        }
    }
}
