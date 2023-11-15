//
//  DessertDetailsViewModelMock.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import UIKit
import Combine
@testable import FetchRewards

class DessertDetailsViewModelMock: DessertDetailsViewModel {
    
    override func fetchMealDetails(dessertId: String) {
        guard let url = makeMealDetailsURL(dessertId: dessertId) else {
            return
        }
        let network = NetworkManager(with: SessionMock.createMockURLSession())
        network.request(url: url)
            .decode(type: DessertDetails.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Network request error: \(error)")
                }
            } receiveValue: { desserDetailsModel in
                self.dessertDetails = desserDetailsModel.meals.first
                
            }
            .store(in: &self.cancellables)
    }

}
