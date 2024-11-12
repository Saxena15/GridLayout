//
//  AppSettingProvider.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation

final class AppSettingProvider{
    
    class var baseURL: String{
        get{
            return self.stringForBundleKey(key: "ServerURL")!
        }
    }
}


extension AppSettingProvider {
    
    class func stringForBundleKey(key: String) -> String?{
        let value = Bundle.main.infoDictionary?[key] as? String
        return value
        
    }
}
