//
//  GridViewLayout.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI

struct GridViewLayout: View {
//    var viewModel = HomeViewModel.shared
   @ObservedObject var viewModel = HomeViewModel()
    private var homeGridItems: [GridItem] = [
        .init(.flexible())
    ]
    
    @State var list1 : [Coverage] = []
    @State var list2 : [Coverage] = []
    @State var list3 : [Coverage] = []
    @State var limit : Int = 100
    
    var body: some View {
        
        ScrollView {
            HStack(alignment: .top) {
                
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $list1)
                }
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $list2)
                }
                LazyVGrid(columns: homeGridItems) {
                    ImageColomn(data: $list3)
                }
            }
        }.onAppear {
            
            viewModel.fetchData(.fetchImages(limit: "\(limit)")) { data in
                let partSize = (data.count + 2) / 3
                self.list1 = Array(data[0..<partSize])
                self.list2 = Array(data[partSize..<2*partSize])
                self.list3 = Array(data[2*partSize..<data.count])
            }
        }
    }
}
 

struct ImageColomn: View{
    @Binding var data : [Coverage]
    var body: some View{
      
        ForEach(data , id: \.id) { data in
            GridItemView(data: data)
        }
    }
}
