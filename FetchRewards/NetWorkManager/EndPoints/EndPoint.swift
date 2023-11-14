//
//  EndPoint.swift
//  FetchRewards
//
//

import UIKit

protocol EndPoint {
    var scheme: String { get }
    
    var host:   String { get }
    
    var path:   String { get }
    
    var queryItems: [URLQueryItem]  { get }
}
