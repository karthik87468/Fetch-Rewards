//
//  HomePageView.swift
//  FetchRewards
//
//

import SwiftUI

struct HomePageView: View {
    let gridItems = [GridItem(.flexible())]
    @ObservedObject var viewModel = MealsDataViewModel()

    var body: some View {
        NavigationView {
            content
                .onAppear {
                    viewModel.fetchMealsData()
                }
                .padding()
        }
    }

    private var content: some View {
        ZStack {
            if viewModel.dessertArray.isEmpty {
                ProgressView(Constants.loading.rawValue)
            } else {
                ScrollView {
                    dessertGridView
                }
            }
        }
    }

    private var dessertGridView: some View {
        LazyVGrid(columns: gridItems, spacing: 16) {
            ForEach(viewModel.dessertArray, id: \.idMeal) { dessertModel in
                NavigationLink(destination: DessertDetailsView(desserID: dessertModel.idMeal ?? "")) {
                    MealItemCellView(selectedModel: dessertModel)
                }.navigationBarTitle(dessertModel.strMeal ?? "", displayMode: .inline)
            }
            .padding(16)
        }
    }
}

#Preview {
    HomePageView()
}
