//
//  FavoriteInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import Foundation
import Combine

protocol FavoriteUseCase {
  func getFavoriteMeals() -> AnyPublisher<[MealModel], Error>
}

class FavoriteInteractor {
  private let repository: MealRepositoryProtocol

  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
}

extension FavoriteInteractor: FavoriteUseCase {
    func getFavoriteMeals() -> AnyPublisher<[MealModel], Error> {
        return repository.getFavoriteMeals()
    }
}
