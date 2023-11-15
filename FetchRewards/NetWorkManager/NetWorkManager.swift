//
//  NetWorkManager.swift
//  FetchRewards
//
//

import UIKit
import Combine

class NetworkManager {
    static let shared = NetworkManager()

    var session: URLSession

    init(with session: URLSession = URLSession.shared) {
        self.session = session
    }

    /// Using the Combine publisher
    func request(url: URL) -> AnyPublisher<Data, URLError> {
        let request = URLRequest(url: url)
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
