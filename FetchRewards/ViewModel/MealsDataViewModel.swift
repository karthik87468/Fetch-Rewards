//
//  MealsDataViewModel.swift
//  FetchRewards
//
//

import UIKit
import Combine
class MealsDataViewModel: ObservableObject {
    @Published var dessertArray: [MealsModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchMealsData() {
        guard let url = makeMealsDataURL() else { return }
        
        NetworkManager.shared
            .request(url: url)
            .decode(type: Meals.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Network request error: \(error)")
                }
            } receiveValue: { meals in
                self.dessertArray = meals.meals.sorted { $0.strMeal ?? "" < $1.strMeal ?? "" }
            }
            .store(in: &cancellables)
    }
    
    private func makeMealsDataURL() -> URL? {
        let endPoint = FetchEndPoint.getMeals(dessertType: .dessert)
        return NetworkModel.getURL(for: endPoint)
    }
}
