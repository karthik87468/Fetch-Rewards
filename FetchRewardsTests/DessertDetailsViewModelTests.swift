//
//  DessertDetailsViewModelTests.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import XCTest
import Combine
@testable import FetchRewards

final class DessertDetailsViewModelTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    let mockModel = MockModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testconfigureMockServer() throws {
        // Arrange
        try mockModel.mockdessertDetailsRequest()

        performNetworkRequest(using: SessionMock.createMockURLSession())
    }

    private func performNetworkRequest(using urlSession: URLSession) {
        guard let url = makeMealsDataURL() else {
            return
        }
        URLProtocol.registerClass(URLProtocolMock.self)
        let network = NetworkManager(with: urlSession)
        let expectation = XCTestExpectation(description: "API request completed")
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
            } receiveValue: { dessertDetails in
                XCTAssertEqual(dessertDetails.meals.first?.strMeal, "Apam balik")
                expectation.fulfill()
                
            }
            .store(in: &cancellables)
    }
    
    private func makeMealsDataURL() -> URL? {
        let endPoint = FetchEndPoint.getMealDetails(mealID: "53049")
        return NetworkModel.getURL(for: endPoint)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

