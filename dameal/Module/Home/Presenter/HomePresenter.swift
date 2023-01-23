//
//  HomePresenter.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import Combine
import SwiftUI

class HomePresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase

  @Published var meals: [MealModel] = []
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false

  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }

  func getMeals() {
    isLoading = true
    homeUseCase.getMeals()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { meals in
        self.meals = meals
      })
      .store(in: &cancellables)
  }

  func linkBuilder<Content: View>(
    for meal: MealModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeDetailView(for: meal)) { content() }
  }

}
