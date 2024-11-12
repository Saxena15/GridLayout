//
//  RealmTransactionsRepresentable.swift
//  GridLayout
//
//  Created by Akash on 12/11/24.
//

import Foundation
import RealmSwift

public protocol RealmTransactionsRepresentable{
    func saveDataRealm(_ imageTask : ImageTask)
    func fetchAllDataRealm() -> Results<ImageTask>
    func deleteDataRealm(_ imageTask: ImageTask)
    func factoryRest()
}
