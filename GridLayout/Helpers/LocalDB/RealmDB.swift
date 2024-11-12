//
//  RealmDB.swift
//  GridLayout
//
//  Created by Akash on 12/11/24.
//

import Foundation
import RealmSwift
import UIKit

public class ImageTask:Object{
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var imageURL: String
    @Persisted var uploadedBy: String
    @Persisted var sourceURL: String
    
}

class RealmDB: RealmTransactionsRepresentable{
    
    private var realm : Realm
    
    init(){
        self.realm = try! Realm()
    }
    
    // Saving fresh data
    func saveDataRealm(_ imageTask : ImageTask){
        try! realm.write {
            print("Data added to Realm")
            realm.add(imageTask)
        }
    }
    
    // fetching existing data
    func fetchAllDataRealm() -> Results<ImageTask>{
        let imageData = realm.objects(ImageTask.self)
        return imageData
    }
    
    //deleting data
    func deleteDataRealm(_ imageTask: ImageTask){
        print("Data deleted from Realm")
        realm.delete(imageTask)
    }
    
    func factoryRest() {
        print("Data cleaned from Realm")
        realm.deleteAll()
    }
    
}



