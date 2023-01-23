//
//  RemoteDataSource.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
  func getMeals() -> AnyPublisher<[MealResponse], Error>
}

final class RemoteDataSource: NSObject {
  private override init() { }

  static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getMeals() -> AnyPublisher<[MealResponse], Error> {
        return Future<[MealResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.meals.url) {
            AF.request(url)
              .validate()
              .responseDecodable(of: MealsResponse.self) { response in
                switch response.result {
                case .success(let value):
                  completion(.success(value.meals))
                case .failure:
                  completion(.failure(URLError.invalidResponse))
                }
              }
          }
        }.eraseToAnyPublisher()
    }
}
