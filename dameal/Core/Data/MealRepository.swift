//
//  MealRepository.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import Combine

protocol MealRepositoryProtocol {
    func getMeals() -> AnyPublisher<[MealModel], Error>
    func getMeal(mealId: String) -> AnyPublisher<MealModel, Error>
    func toggleFavoriteMeal(mealId: String) -> AnyPublisher<MealModel, Error>
}

final class MealRepository: NSObject {
    fileprivate let locale: LocaleDataSourceProtocol
    fileprivate let remote: RemoteDataSourceProtocol

    private init(locale: LocaleDataSourceProtocol, remote: RemoteDataSourceProtocol) {
        self.locale = locale
        self.remote = remote
    }

    static let sharedInstance: MealRepository = {
        let localeDataSource = LocaleDataSource.sharedInstance
        let remoteDataSource = RemoteDataSource.sharedInstance
        return MealRepository(
            locale: localeDataSource,
            remote: remoteDataSource
        )
    }()
}

extension MealRepository: MealRepositoryProtocol {
    func getMeals() -> AnyPublisher<[MealModel], Error> {
        return self.locale.getMeals()
            .flatMap { result -> AnyPublisher<[MealModel], Error> in
                if result.isEmpty {
                    return self.remote.getMeals()
                        .map { MealMapper.mapMealResponsesToEntities(input: $0) }
                        .catch { _ in self.locale.getMeals() }
                        .flatMap { self.locale.addMeals(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getMeals()
                                .map { MealMapper.mapMealEntitiesToDomains(input: $0) }
                        }.eraseToAnyPublisher()
                } else {
                    return self.locale.getMeals()
                        .map { MealMapper.mapMealEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }

    func getMeal(mealId: String) -> AnyPublisher<MealModel, Error> {
        return self.locale.getMeal(by: mealId)
            .flatMap { result -> AnyPublisher<MealModel, Error> in
                if result.category.isEmpty {
                    return self.remote.getMeal(mealId: mealId)
                        .map { MealMapper.mapMealResponseToEntity(input: $0) }
                        .catch { _ in self.locale.getMeal(by: mealId) }
                        .flatMap { self.locale.updateMeal(by: mealId, meal: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getMeal(by: mealId)
                                .map { MealMapper.mapMealEntityToDomain(input: $0) }
                        }.eraseToAnyPublisher()
                } else {
                    return self.locale.getMeal(by: mealId)
                        .map { MealMapper.mapMealEntityToDomain(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }

    func toggleFavoriteMeal(mealId: String) -> AnyPublisher<MealModel, Error> {
        return self.locale.toggleFavoriteMeal(by: mealId)
            .map { MealMapper.mapMealEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
}
