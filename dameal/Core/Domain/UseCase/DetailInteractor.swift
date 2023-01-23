//
//  DetailInteractor.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Combine

protocol DetailUseCase {
    func getMeal() -> AnyPublisher<MealModel, Error>
    func getMeal() -> MealModel
}

class DetailInteractor {
    private let repository: MealRepositoryProtocol
    private let meal: MealModel

    required init(repository: MealRepositoryProtocol, meal: MealModel) {
        self.repository = repository
        self.meal = meal
    }
}

extension DetailInteractor: DetailUseCase {
    func getMeal() -> AnyPublisher<MealModel, Error> {
        return repository.getMeal(mealId: meal.id)
    }
    func getMeal() -> MealModel {
        return meal
    }
}
