//
//  HomeInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Foundation
import Combine

protocol HomeUseCase {
  func getMeals() -> AnyPublisher<[MealModel], Error>
}

class HomeInteractor {
  private let repository: MealRepositoryProtocol

  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
}

extension HomeInteractor: HomeUseCase {
    func getMeals() -> AnyPublisher<[MealModel], Error> {
        return repository.getMeals()
    }
}
