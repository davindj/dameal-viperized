//
//  FavoriteInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import Foundation
import Combine

public protocol FavoriteUseCase {
  func getFavoriteMeals() -> AnyPublisher<[MealModel], Error>
}

public class FavoriteInteractor {
  private let repository: MealRepositoryProtocol

  public required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
}

extension FavoriteInteractor: FavoriteUseCase {
    public func getFavoriteMeals() -> AnyPublisher<[MealModel], Error> {
        return repository.getFavoriteMeals()
    }
}
