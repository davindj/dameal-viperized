//
//  MealMapper.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Foundation

final class MealMapper {
    static func mapMealResponsesToDomains(
        input mealResponses: [MealResponse]
    ) -> [MealModel] {
        return mealResponses.map { result in
            return MealModel(
                id: result.id,
                title: result.title,
                image: result.image
            )
        }
    }

    static func mapMealResponseToDomain(
        input mealResponse: MealResponse
    ) -> MealModel {
        let ingredientNames = [
          mealResponse.ingredient1, mealResponse.ingredient2,
          mealResponse.ingredient3, mealResponse.ingredient4,
          mealResponse.ingredient5, mealResponse.ingredient6,
          mealResponse.ingredient7, mealResponse.ingredient8,
          mealResponse.ingredient9, mealResponse.ingredient10,
          mealResponse.ingredient11, mealResponse.ingredient12,
          mealResponse.ingredient13, mealResponse.ingredient14,
          mealResponse.ingredient15, mealResponse.ingredient16,
          mealResponse.ingredient17, mealResponse.ingredient18,
          mealResponse.ingredient19, mealResponse.ingredient20
        ].compactMap { $0 }.filter { $0 != "" }

        let measures = [
          mealResponse.measure1, mealResponse.measure2,
          mealResponse.measure3, mealResponse.measure4,
          mealResponse.measure5, mealResponse.measure6,
          mealResponse.measure7, mealResponse.measure8,
          mealResponse.measure9, mealResponse.measure10,
          mealResponse.measure11, mealResponse.measure12,
          mealResponse.measure13, mealResponse.measure14,
          mealResponse.measure15, mealResponse.measure16,
          mealResponse.measure17, mealResponse.measure18,
          mealResponse.measure19, mealResponse.measure20
        ].compactMap { $0 }.filter { $0 != "" }

        let ingredients = zip(ingredientNames, measures)
          .map { "\($0) \($1)" }
          .joined(separator: "\n")

        return MealModel(
            id: mealResponse.id,
            title: mealResponse.title,
            image: mealResponse.image,
            category: mealResponse.category ?? "Unknow",
            area: mealResponse.area ?? "Unknow",
            instructions: mealResponse.instructions ?? "Unknow",
            tag: mealResponse.tag ?? "Unknow",
            youtube: mealResponse.youtube ?? "Unknow",
            source: mealResponse.source ?? "Unknow",
            ingredients: ingredients,
            favorite: false
        )
    }
}
