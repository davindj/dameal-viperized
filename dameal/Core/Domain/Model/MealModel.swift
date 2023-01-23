//
//  MealModel.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation

struct MealModel: Equatable, Identifiable {
    let id: String
    let title: String
    let image: String
    var category: String = ""
    var area: String = ""
    var instructions: String = ""
    var tag: String = ""
    var youtube: String = ""
    var source: String = ""
    var ingredients: String = ""
    var favorite: Bool = false
}
