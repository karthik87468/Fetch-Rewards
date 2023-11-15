//
//  MealsDataViewModelTest.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import XCTest
import Combine
@testable import FetchRewards

final class MealsDataViewModelTest: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    let mockModel = MockModel()
    let mealViewModelMock = MealsDataViewModelMock()
    override func setUpWithError() throws {
        try mockModel.mockdessertRequest()
    }
    
    
    func testMealViewModel() throws {
        performNetworkRequest(using: SessionMock.createMockURLSession())
    }
    
    private func performNetworkRequest(using urlSession: URLSession) {
        URLProtocol.registerClass(URLProtocolMock.self)
        let expectation = XCTestExpectation(description: "API request completed")
        mealViewModelMock.fetchMealsData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.mealViewModelMock.dessertArray.first?.idMeal, "53049")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}

