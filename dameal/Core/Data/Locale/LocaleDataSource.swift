//
//  LocaleDataSource.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: AnyObject {
    func getMeals() -> AnyPublisher<[MealEntity], Error>
//    func getMeal(by mealId: String) -> AnyPublisher<MealEntity, Error>

    func addMeals(from meals: [MealEntity]) -> AnyPublisher<Bool, Error>
//    func updateMeal(by mealId: String, meal: MealEntity) -> AnyPublisher<Bool, Error>
//
//    func getFavoriteMeals() -> AnyPublisher<[MealEntity], Error>
//    func updateFavoriteMeal(by mealId: String) -> AnyPublisher<MealEntity, Error>
}

final class LocaleDataSource: NSObject {
    private let realm: Realm?

    private init(realm: Realm?) {
        self.realm = realm
    }

    static let sharedInstance: LocaleDataSource = {
        let realm = try? Realm()
        return LocaleDataSource(realm: realm)
    }()
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    func getMeals() -> AnyPublisher<[MealEntity], Error> {
        return Future<[MealEntity], Error> { completion in
            if let realm = self.realm {
                let meals = {
                    realm.objects(MealEntity.self)
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(meals.toArray(ofType: MealEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func addMeals(from meals: [MealEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for meal in meals {
                            realm.add(meal, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
}
