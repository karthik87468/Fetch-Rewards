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
        try mockModel.mockdessertDetailsRequest()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testconfigureMockServer() throws {
        performNetworkRequest(using: SessionMock.createMockURLSession())
    }

    private func performNetworkRequest(using urlSession: URLSession) {
        URLProtocol.registerClass(URLProtocolMock.self)
        let expectation = XCTestExpectation(description: "API request completed")
        let dessertdetailsMock = DessertDetailsViewModelMock()
        dessertdetailsMock.fetchMealDetails(dessertId: "53049")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(dessertdetailsMock.dessertDetails?.strMeal, "Apam balik")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}

