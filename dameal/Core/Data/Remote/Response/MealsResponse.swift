//
//  MealsResponse.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation

struct MealsResponse: Decodable {
  let meals: [MealResponse]
}

struct MealResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
      case id = "idMeal"
      case title = "strMeal"
      case image = "strMealThumb"
    }

    let id: String
    let title: String
    let image: String
}
