//
//  GridItemView.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI


struct GridItemView: View {
    
    var data: ImageObj
    var viewModel : HomeViewModel
    @Environment(\.openURL) var openURL
    
    init(data: ImageObj, viewModel : HomeViewModel) {
        self.data = data
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: URL(string: data.imageURL)) { img in
                    img.resizable()
                } placeholder: {
                    Image(systemName: "photo.fill")
                }.frame(width: 100, height: 100)
                    .border(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Button(action: {
                    guard let url = URL(string: data.sourceURL) else { return }
                    
                    openURL(url)
                    
                }, label: {
                    Text(data.uploadedBy)
                        .foregroundColor(.black)
                        .lineLimit(2)
                })
                
            }.background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray)
            ).frame(width: 100, height: CGFloat.random(in: 100...150), alignment: .center)
                .padding(.vertical, 10)
        }
        
    }
}
