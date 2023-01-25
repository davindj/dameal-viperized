//
//  HomeInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Foundation
import Combine

public protocol HomeUseCase {
  func getMeals() -> AnyPublisher<[MealModel], Error>
}

public class HomeInteractor {
  private let repository: MealRepositoryProtocol

  public required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
}

extension HomeInteractor: HomeUseCase {
    public func getMeals() -> AnyPublisher<[MealModel], Error> {
        return repository.getMeals()
    }
}
