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
    func getMeal(by mealId: String) -> AnyPublisher<MealEntity, Error>
    //    func getFavoriteMeals() -> AnyPublisher<[MealEntity], Error>

    func addMeals(from meals: [MealEntity]) -> AnyPublisher<Bool, Error>
    func updateMeal(by mealId: String, meal: MealEntity) -> AnyPublisher<Bool, Error>
    func toggleFavoriteMeal(by mealId: String) -> AnyPublisher<MealEntity, Error>
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

    func getMeal(by mealId: String) -> AnyPublisher<MealEntity, Error> {
        return Future<MealEntity, Error> { completion in
            if let realm = self.realm {
                let meals = {
                    realm.objects(MealEntity.self)
                        .filter("id = '\(mealId)'")
                }()
                guard let meal = meals.first else {
                    completion(.failure(DatabaseError.requestFailed))
                    return
                }
                completion(.success(meal))
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

    func updateMeal(by mealId: String, meal: MealEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm, let mealEntity = {
                realm.objects(MealEntity.self).filter("id = '\(mealId)'")
            }().first {
                do {
                    try realm.write {
                        mealEntity.setValue(meal.area, forKey: "area")
                        mealEntity.setValue(meal.instructions, forKey: "instructions")
                        mealEntity.setValue(meal.tag, forKey: "tag")
                        mealEntity.setValue(meal.youtube, forKey: "youtube")
                        mealEntity.setValue(meal.source, forKey: "source")
                        mealEntity.setValue(meal.favorite, forKey: "favorite")
                        mealEntity.setValue(meal.ingredients, forKey: "ingredients")
                        mealEntity.setValue(meal.category, forKey: "category")
                    }
                    completion(.success(true))
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func toggleFavoriteMeal(by mealId: String) -> AnyPublisher<MealEntity, Error> {
        return Future<MealEntity, Error> { completion in
            if let realm = self.realm, let mealEntity = {
                realm.objects(MealEntity.self).filter("id = '\(mealId)'")
            }().first {
                do {
                    try realm.write {
                        mealEntity.setValue(!mealEntity.favorite, forKey: "favorite")
                    }
                    completion(.success(mealEntity))
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
