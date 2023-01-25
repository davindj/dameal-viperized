//
//  HomeRouter.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

class HomeRouter {
    func makeDetailView(for meal: MealModel) -> some View {
        let detailUseCase = Injection.provideDetailUseCase(meal: meal)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
}
