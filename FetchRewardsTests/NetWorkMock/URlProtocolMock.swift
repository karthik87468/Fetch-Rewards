//
//  URlProtocolMock.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import Foundation
import Combine

class URLProtocolMock: URLProtocol {
    static var testURLs = [URL?: (Data?, HTTPURLResponse?, Error?)]()

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let url = request.url else {
            client?.urlProtocolDidFinishLoading(self)
            return
        }

        if let (data, response, error) = URLProtocolMock.testURLs[url] {
            if let response = response {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            if let error = error {
                client?.urlProtocol(self, didFailWithError: error)
            }
        }

        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}

