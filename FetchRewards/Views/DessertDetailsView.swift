//
//  DessertInfor.swift
//  FetchRewards
//
//

import SwiftUI

struct DessertDetailsView: View {
    var desserID: String
    @ObservedObject var viewModel = DessertDetailsViewModel()
    var body: some View {
        VStack {
            ScrollView {
                if let strMeal = viewModel.dessertDetails?.strMeal {
                    HStack {
                        Text(Constants.dessertName.rawValue).padding(.top, 10).padding(.leading, 40).bold()
                        Text(strMeal).padding(.top, 10).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                if let strArea = viewModel.dessertDetails?.strArea {
                    HStack {
                        Text(Constants.area.rawValue).padding(.top, 10).padding(.leading, 40).bold()
                        Text(strArea).padding(.top, 10).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                if let strInstructions = viewModel.dessertDetails?.strInstructions {
                    VStack {
                        Text(Constants.instructions.rawValue).frame(maxWidth: .infinity, alignment: .leading) .font(.custom("HelveticaNeue-Regular", size: 25)).padding(.leading, 35).padding(.top,10).bold()
                        Spacer()
                        Text(strInstructions).padding(.top, 10).padding(.leading, 40)
                    }
                }
                if let ingredients = viewModel.dessertDetails?.ingredients {
                    ingredientsSection(ingredients: ingredients)
                }
              
            }
        }.onAppear(perform: {
            viewModel.fetchMealDetails(dessertId: desserID)
        })
    }
    
    private func ingredientsSection(ingredients: [Ingredient]) -> some View {
        return ForEach(ingredients, id: \.self) { ingredient in
            IngredientsView(ingredient: ingredient)
        }
      }
}

#Preview {
    DessertDetailsView(desserID: "53049")
}

struct IngredientsView: View {
    var ingredient: Ingredient
    var body: some View {
        VStack {
            Divider()
            Text(ingredient.name).frame(maxWidth: .infinity, alignment: .leading) .font(.custom("HelveticaNeue-Bold", size: 15)).padding(.leading, 35).padding(.top,10)
            Text(ingredient.quantity).frame(maxWidth: .infinity, alignment: .leading) .font(.custom("HelveticaNeue-Regular", size: 15)).padding(.leading, 35).padding(.top,10)
            
        }
    }
}
