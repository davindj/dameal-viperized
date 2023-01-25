//
//  DetailInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Combine

public protocol DetailUseCase {
    func getMeal() -> AnyPublisher<MealModel, Error>
    func getMeal() -> MealModel
    func toggleFavoriteMeal() -> AnyPublisher<MealModel, Error>
}

public class DetailInteractor {
    private let repository: MealRepositoryProtocol
    private let meal: MealModel

    public required init(repository: MealRepositoryProtocol, meal: MealModel) {
        self.repository = repository
        self.meal = meal
    }
}

extension DetailInteractor: DetailUseCase {
    public func getMeal() -> AnyPublisher<MealModel, Error> {
        return repository.getMeal(mealId: meal.id)
    }
    public func getMeal() -> MealModel {
        return meal
    }
    public func toggleFavoriteMeal() -> AnyPublisher<MealModel, Error> {
        return repository.toggleFavoriteMeal(mealId: meal.id)
    }
}
