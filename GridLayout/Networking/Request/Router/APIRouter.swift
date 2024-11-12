//
//  APIRouter.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation


public enum APIRouter: ClientRequestConfig{
    case fetchImages(limit: String)
    
    
    
    public var baseURLString: String {
        switch self {
        case .fetchImages(_):
            return "https://acharyaprashant.org/api/"
        }
    }
    
    public var route: String{
        switch self {
        case .fetchImages(_):
            return "v2/"
        }
    }
    
    public var path: String{
        switch self {
        case .fetchImages(_):
            return "content/misc/media-coverages?"
        }
    }
    
    public var method: RequestMethod{
        switch self {
        case .fetchImages(_):
            return .get
        }
    }
    
    public var headers: [RequestHeader]? {
        switch self {
        case .fetchImages(_):
            return []
        }
    }
    
    public var params: String {
        switch self {
        case .fetchImages(let limit):
            return "limit=\(limit)"
        }
    }
    
    public var bodyData: Data? {
        switch self {
        case .fetchImages(_):
            return nil
        }
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .fetchImages(_):
            return .useProtocolCachePolicy
        }
    }
}
