//
//  MealItemCellView.swift
//  FetchRewards
//
//

import SwiftUI

struct MealItemCellView: View {
    var selectedModel: MealsModel?
    
    var body: some View {
        VStack {
            ZStack {
                if let model = selectedModel,
                   let imageUrl = model.strMealThumb,
                   let dessertName = model.strMeal {
                    VStack {
                        VStack {
                            ImageLoaderView(urlString: imageUrl)
                        }.cornerRadius(20)
                        Text(dessertName)
                            .font(.custom("HelveticaNeue-Bold", size: 20))
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10).padding(.top, -50)
                    }
                 
                }
            }.frame(maxHeight: 400)
        }
    }
}
