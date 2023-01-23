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
}
