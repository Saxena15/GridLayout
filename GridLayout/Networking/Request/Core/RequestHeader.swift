//
//  RequestHeader.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation

public struct RequestHeader {
    public let key: String
    public let value: String
    
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
