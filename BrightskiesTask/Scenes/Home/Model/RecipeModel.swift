//
//  RecipeModel.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.


import Foundation

// MARK: - RecipeModelElement
struct RecipeModelElement: Codable {
   
    public var isFavourite = false
    public var isSelected = false
    let id, fats, name, time: String?
    let image: String?
    let weeks: [String]?
    let carbos, fibers: String?
    let rating: Double?
    let country: String?
    let ratings: Int?
    let calories, headline: String?
    let keywords, products: [String]?
    let proteins: String?
    let favorites, difficulty: Int?
    let recipeModelDescription: String?
    let highlighted: Bool?
    let ingredients: [String]?
    let deliverableIngredients: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty
        case recipeModelDescription = "description"
        case highlighted, ingredients
        case deliverableIngredients = "deliverable_ingredients"
    }
}

typealias RecipeModel = [RecipeModelElement]


