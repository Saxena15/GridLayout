//
//  HomeView.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI


struct HomeView: View{
    var db = RealmDB()
    var body: some View{
        VStack{
            GridViewLayout(realm: db, viewModel: HomeViewModel(realm: db))
        }
        
    }
}








