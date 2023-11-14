//
//  MealsModel.swift
//  FetchRewards
//
//
import UIKit

struct Meals: Decodable {
    let meals: [MealsModel]
}

// having optional varibale can prevent the null variable using JSON decoder
struct MealsModel: Decodable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
}


