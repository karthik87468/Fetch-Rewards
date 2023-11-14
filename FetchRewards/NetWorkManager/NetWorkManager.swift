//
//  NetWorkManager.swift
//  FetchRewards
//
//

import UIKit
import Combine

class NetworkManager {
    static let shared = NetworkManager()

    private let session: URLSession

    private init() {
        session = URLSession.shared
    }

    /// Using the Combine publisher
    func request(url: URL) -> AnyPublisher<Data, URLError> {
        let request = URLRequest(url: url)
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
