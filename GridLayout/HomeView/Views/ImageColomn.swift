//
//  ImageColomn.swift
//  GridLayout
//
//  Created by Akash on 12/11/24.
//

import Foundation
import SwiftUI

struct ImageColomn: View{
    @Binding var data : [ImageObj]
    var viewModel : HomeViewModel
    
    init(data: Binding<[ImageObj]>, viewModel: HomeViewModel) {
        self._data = data
        self.viewModel = viewModel
    }
    
    var body: some View{
        ForEach(data , id: \.id) { data in
            GridItemView(data: data, viewModel: viewModel)
        }
    }
}
