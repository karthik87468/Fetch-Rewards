//
//  MockModel.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import XCTest
import Foundation

class MockModel: NSObject {
    
    func mockdessertRequest() throws {
        guard let jsonData = readdessertJSONFromFile() else {
            return
        }
        let inputURL = try XCTUnwrap(URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
        let testResponse = HTTPURLResponse(url: inputURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolMock.testURLs[inputURL] = (jsonData, testResponse, nil)
    }
    
    func readdessertJSONFromFile() -> Data? {
        guard let fileURL = Bundle.main.url(forResource: "MealsDataMock", withExtension: "json") else { return nil}
        do {
            let data = try Data(contentsOf: fileURL)
            return data
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return nil
    }
    
    func mockdessertDetailsRequest() throws {
        guard let jsonData = readdessertDetailsJSONFromFile() else {
            return
        }
        let inputURL = try XCTUnwrap(URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=53049"))
        let testResponse = HTTPURLResponse(url: inputURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolMock.testURLs[inputURL] = (jsonData, testResponse, nil)
    }
    
    
    func readdessertDetailsJSONFromFile() -> Data? {
        guard let fileURL = Bundle.main.url(forResource: "DessertDetailsMock", withExtension: "json") else { return nil}
        do {
            let data = try Data(contentsOf: fileURL)
            return data
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return nil
    }

}
