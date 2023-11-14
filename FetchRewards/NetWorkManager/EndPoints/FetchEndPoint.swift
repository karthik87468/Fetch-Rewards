//
//  EndPoints.swift
//  FetchRewards
//

import Foundation

//// EndPoints contains all the networking EndPoint we have added in our project.
enum DessertType: String {
    case dessert = "Dessert"
}

enum FetchEndPoint: EndPoint {
    case getMeals(dessertType: DessertType)
    case getMealDetails(mealID: String)

    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "www.themealdb.com"
    }
    
    var path: String {
        switch self {
        case .getMeals:
            return "/api/json/v1/1/filter.php"
        case .getMealDetails:
            return "/api/json/v1/1/lookup.php"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getMeals(let dessertType):
            return [URLQueryItem(name: "c", value: dessertType.rawValue)]
        case .getMealDetails(mealID: let mealID):
            return [URLQueryItem(name: "i", value: String(mealID))]
        }
    }
}
