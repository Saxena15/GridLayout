//
//  DataRequestManager.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import UIKit

class DataRequestManager: APIRequestLodable{
    
    
    func data(_ eventType : APIRouter , completion: (([Coverage])-> Void)?){

        let urlString = eventType.url
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            // Check if data is received
            guard let data = data else {
                print("No data received.")
                return
            }
            
            
            // Check for valid response and status code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    
                    let response = try JSONDecoder().decode([Coverage].self, from: data)
                    completion?(response)
                    
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            } else {
                print("Invalid response or status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
            }
        }
        task.resume()
    }

}


