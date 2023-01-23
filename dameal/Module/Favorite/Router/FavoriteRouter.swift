//
//  FavoriteRouter.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import SwiftUI

class FavoriteRouter {
    func makeDetailView(for meal: MealModel) -> some View {
        let detailUseCase = Injection.sharedInstance.resolve(DetailUseCase.self, argument: meal)!
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
}