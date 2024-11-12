//
//  ImageItem.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI

// Model for the main coverage object
public struct Coverage: Codable {
    var id: String
    var thumbnail: Thumbnail
    var coverageURL: String
    var publishedBy: String
}


// Model for the thumbnail object
public struct Thumbnail: Codable {
    
    var domain: String
    var basePath: String
    var key: String
}
