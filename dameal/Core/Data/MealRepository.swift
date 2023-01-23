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
}

final class MealRepository: NSObject {
    fileprivate let remote: RemoteDataSource

    private init(remote: RemoteDataSource) {
        self.remote = remote
    }

    static let sharedInstance: MealRepository = {
        let remoteDataSource = RemoteDataSource.sharedInstance
        return MealRepository(remote: remoteDataSource)
    }()
}

extension MealRepository: MealRepositoryProtocol {
    func getMeals() -> AnyPublisher<[MealModel], Error> {
        return self.remote.getMeals()
            .map { MealMapper.mapMealResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
