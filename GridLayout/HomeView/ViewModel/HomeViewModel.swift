//
//  HomeViewModel.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import RealmSwift


class HomeViewModel : ObservableObject {
    @Published var data : [Coverage] = []
    var dataRequestManager : DataRequestManager
    static let shared = HomeViewModel()
    
    init() {
        self.dataRequestManager = DataRequestManager()
    }
    
    func fetchData(_ eventType: APIRouter, completion: (([Coverage])->Void)?){
        
        self.dataRequestManager.data(eventType){ coverages in
          
            completion?(coverages)
            
            let _ = coverages.forEach { coverage in
                
                let imageTask = ImageTask()
                imageTask.imageURL = coverage.coverageURL
                imageTask.uploadedBy =  coverage.publishedBy
                imageTask.imageURL = self.fetchImageURL(coverage.thumbnail)
                
            }
        }
        
    }
    
    func fetchImageURL(_ thumbnail: Thumbnail) -> String{
        return thumbnail.domain + "/" + thumbnail.basePath + "/0/" + thumbnail.key
    }
}
