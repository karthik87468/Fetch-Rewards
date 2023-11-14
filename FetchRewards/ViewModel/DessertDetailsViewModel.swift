//
//  DessertDetailsViewModel.swift
//  FetchRewards
//
//

import UIKit
import Combine

class DessertDetailsViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var dessertDetails: MealDetailsModel?

    func fetchMealDetails(dessertId: String) {
        guard let url = makeMealDetailsURL(dessertId: dessertId) else { return }

        NetworkManager.shared
            .request(url: url)
            .decode(type: DessertDetails.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Network request error: \(error)")
                }
            } receiveValue: { dessertDetailsResponse in
                self.dessertDetails = dessertDetailsResponse.meals.first
            }
            .store(in: &cancellables)
    }

    private func makeMealDetailsURL(dessertId: String) -> URL? {
        let endPoint = FetchEndPoint.getMealDetails(mealID: dessertId)
        return NetworkModel.getURL(for: endPoint)
    }
}
