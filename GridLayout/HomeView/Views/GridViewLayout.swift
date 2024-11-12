//
//  GridViewLayout.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct GridViewLayout: View {
    
    var viewModel : HomeViewModel
    var realm : RealmDB
    
    @State var displayArr : [ImageObj] = []
    private var homeGridItems: [GridItem] = [ .init(.flexible()) ]
    @State var limit : Int = 100
    
    init(realm : RealmDB, viewModel : HomeViewModel){
        self.realm = realm
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView {
            HStack(alignment: .top) {
                
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $displayArr, viewModel: viewModel)
                }
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $displayArr, viewModel: viewModel)
                }
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $displayArr, viewModel: viewModel)
                }
            }
        }.onAppear {
            
            let cachedData = realm.fetchAllDataRealm()
            if cachedData.isEmpty { // if cache is present then api call not needed
                viewModel.fetchData(.fetchImages(limit: "\(limit)")) {
                    sortColomns(data: realm.fetchAllDataRealm())
                }
            }else{
                sortColomns(data: realm.fetchAllDataRealm())
            }
        }
    }
    
    func sortColomns(data: Results<ImageTask>){
        self.displayArr = data[0..<data.count].map{ImageObj(id: "\($0.id)", imageURL: $0.imageURL, uploadedBy: $0.uploadedBy, sourceURL: $0.sourceURL)}
    }
}
