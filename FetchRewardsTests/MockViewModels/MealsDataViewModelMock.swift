//
//  MealsDataViewModelMock.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import UIKit
import Combine
@testable import FetchRewards

class MealsDataViewModelMock: MealsDataViewModel {
    
    override func fetchMealsData() {
        guard let url = makeMealsDataURL() else {
            return
        }
        let network = NetworkManager(with: SessionMock.createMockURLSession())
        network.request(url: url)
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
                self.dessertArray = meals.meals
            }
            .store(in: &self.cancellables)
    }

}
