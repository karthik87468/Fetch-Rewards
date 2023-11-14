//
//  MealDetailsModel.swift
//  FetchRewards
//
//
import UIKit

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let quantity: String
}

struct MealDetailsModel: Decodable {
    let idMeal, strMeal: String?
    let strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strSource: String?
    let strImageSource, strCreativeCommonsConfirmed, dateModified: String?
    let name: String?
    let founded: Int?
    let members: [String]?

    // Ingredients
    var ingredients = [Ingredient]()

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified, name, founded, members
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17,strIngredient18,strIngredient19,strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
             strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal)
        self.strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        self.strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
        self.strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        self.strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        self.strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        self.strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        self.strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        self.strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        self.strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        self.dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.founded = try container.decodeIfPresent(Int.self, forKey: .founded)
        self.members = try container.decodeIfPresent([String].self, forKey: .members)

        // Decode 'ingredients' and 'measurements'
        var ingredientsArray = [Ingredient]()
        /// this will validate weather key is present, based on optional wraping  if key is present in than only added into the array
        for i in 1...20 {
           if let ingredientkey = CodingKeys(rawValue: "strIngredient\(i)"),
              let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientkey),
              !ingredient.isEmpty,
              let key = CodingKeys(rawValue: "strMeasure\(i)"),
              let measurement = try container.decodeIfPresent(String.self, forKey: key)
            {
               ingredientsArray.append(.init(name: ingredient, quantity: measurement))
           }
        }

        self.ingredients = ingredientsArray
    }
}

struct DessertDetails: Decodable {
    let meals: [MealDetailsModel]
}
