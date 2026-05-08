//
//  Models.swift
//  API Recipes 2
//
//  Created by Maya Krishnan on 5/8/26.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let image: String
}

