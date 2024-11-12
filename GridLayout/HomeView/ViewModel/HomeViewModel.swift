//
//  HomeViewModel.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import RealmSwift


class HomeViewModel : ObservableObject, HomeViewModelRepresentable{
    
    var dataRequestManager : DataRequestManager
    var realm : RealmDB
    
    init(realm : RealmDB) {
        self.realm = realm
        self.dataRequestManager = DataRequestManager()
    }
    
    func fetchData(_ eventType: APIRouter, completion: (()->Void)?){
        
        self.dataRequestManager.data(eventType){ coverages in
          
            let _ = coverages.forEach { coverage in
                
                let imageTask = ImageTask()
                imageTask.imageURL = coverage.coverageURL
                imageTask.uploadedBy =  coverage.publishedBy
                imageTask.imageURL = self.fetchImageURL(coverage.thumbnail)
                DispatchQueue.main.async {
                    self.realm.saveDataRealm(imageTask)
                }
                
                completion?()
            }
        }
        
    }
    
    func fetchImageURL(_ thumbnail: Thumbnail) -> String{
        return thumbnail.domain + "/" + thumbnail.basePath + "/0/" + thumbnail.key
    }
}
