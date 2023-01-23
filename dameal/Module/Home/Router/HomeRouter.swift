//
//  HomeRouter.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import SwiftUI

class HomeRouter {
    func makeDetailView(for meal: MealModel) -> some View {
//        let detailUseCase = Injection.init().provideDetail(category: category)
//        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView()
    }
}
