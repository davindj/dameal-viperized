//
//  MealMapper.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import Foundation

final class MealMapper {
    static func mapMealResponsesToEntities(
        input mealResponses: [MealResponse]
    ) -> [MealEntity] {
        return mealResponses.map { result in
            let newMeal = MealEntity()
            newMeal.id = result.id
            newMeal.title = result.title
            newMeal.image = result.image
            return newMeal
        }
    }
    
    static func mapMealResponseToEntity(
        input mealResponse: MealResponse
    ) -> MealEntity {
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
        
        let mealEntity = MealEntity()
        mealEntity.id = mealResponse.id
        mealEntity.title = mealResponse.title
        mealEntity.image = mealResponse.image
        mealEntity.category = mealResponse.category ?? "-"
        mealEntity.area = mealResponse.area ?? "-"
        mealEntity.instructions = mealResponse.instructions ?? ""
        mealEntity.tag = mealResponse.tag ?? ""
        mealEntity.youtube = mealResponse.youtube ?? "-"
        mealEntity.source = mealResponse.source ?? "-"
        mealEntity.ingredients = ingredients
        mealEntity.favorite = false
        
        return mealEntity
    }
    
    static func mapMealEntitiesToDomains (
        input mealEntities: [MealEntity]
    ) -> [MealModel] {
        return mealEntities.map { mapMealEntityToDomain(input: $0) }
    }
    
    static func mapMealEntityToDomain(
        input mealEntity: MealEntity
    ) -> MealModel {
        return MealModel(
            id: mealEntity.id,
            title: mealEntity.title,
            image: mealEntity.image,
            category: mealEntity.category,
            area: mealEntity.area,
            instructions: mealEntity.instructions,
            tag: mealEntity.tag,
            youtube: mealEntity.youtube,
            source: mealEntity.source,
            ingredients: mealEntity.ingredients,
            favorite: mealEntity.favorite
        )
    }
}
