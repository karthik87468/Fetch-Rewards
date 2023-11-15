//
//  SessionMock.swift
//  FetchRewardsTests
//
//  Created by karthik on 11/15/23.
//

import UIKit

class SessionMock: NSObject {
    class func createMockURLSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: config)
    }
}
