//
//  NetworkModel.swift
//  FetchRewards
//
//

import UIKit

class NetworkModel: NSObject {
   class func getURL(for endpoint: EndPoint) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.host = endpoint.host
        urlComponent.scheme = endpoint.scheme
        urlComponent.path = endpoint.path
        urlComponent.queryItems = endpoint.queryItems
        return urlComponent.url
    }

}
