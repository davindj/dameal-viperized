//
//  MealModel.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation

public struct MealModel: Equatable, Identifiable {
    public let id: String
    public let title: String
    public let image: String
    public var category: String = ""
    public var area: String = ""
    public var instructions: String = ""
    public var tag: String = ""
    public var youtube: String = ""
    public var source: String = ""
    public var ingredients: String = ""
    public var favorite: Bool = false

    public init(
        id: String,
        title: String,
        image: String,
        category: String = "",
        area: String = "",
        instructions: String = "",
        tag: String = "",
        youtube: String = "",
        source: String = "",
        ingredients: String = "",
        favorite: Bool = false
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.category = category
        self.area = area
        self.instructions = instructions
        self.tag = tag
        self.youtube = youtube
        self.source = source
        self.ingredients = ingredients
        self.favorite = favorite
    }
}
