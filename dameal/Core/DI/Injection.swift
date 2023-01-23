//
//  Injection.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import Swinject

final class Injection: NSObject {
    static let sharedInstance: Container = {
        let container = Container()
        container.register(MealRepositoryProtocol.self) { _ in MealRepository.sharedInstance }

        container.register(HomeUseCase.self) { r in
            HomeInteractor(repository: r.resolve(MealRepositoryProtocol.self)!)
        }
        container.register(DetailUseCase.self) { r, meal in
            DetailInteractor(
                repository: r.resolve(MealRepositoryProtocol.self)!,
                meal: meal
            )
        }
        container.register(FavoriteUseCase.self) { r in
            FavoriteInteractor(repository: r.resolve(MealRepositoryProtocol.self)!)
        }

        return container
    }()
}
