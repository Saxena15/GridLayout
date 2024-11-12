//
//  ClientRequestConfig.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation


public protocol ClientRequestConfig{
    var baseURLString: String { get }
    var route: String { get }
    var path: String { get }
    
    var method: RequestMethod { get }
    var headers: [RequestHeader]? { get }
    var params: String { get }
    var bodyData: Data? { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}

public extension ClientRequestConfig {
    var url: String {
        return self.baseURLString + self.route + self.path + self.params
    }
    
    var cachePolicy: URLRequest.CachePolicy { return .useProtocolCachePolicy}
    
}
