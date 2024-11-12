//
//  APIRequestLodable.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation


public protocol APIRequestLodable{
    func data(_ eventType : APIRouter , completion: (([Coverage])-> Void)?)
}
