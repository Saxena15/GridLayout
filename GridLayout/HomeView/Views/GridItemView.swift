//
//  GridItemView.swift
//  GridLayout
//
//  Created by Akash on 11/11/24.
//

import Foundation
import SwiftUI


struct GridItemView: View {
    
    var data: Coverage
    let viewModel = HomeViewModel()
    @Environment(\.openURL) var openURL
    
    init(data: Coverage) {
        self.data = data
    }
    
    var body: some View {
        VStack{
            VStack{
                
                AsyncImage(url: URL(string: viewModel.fetchImageURL(data.thumbnail))) { img in
                    img.resizable()
                } placeholder: {
                    Image(systemName: "photo.fill")
                }.frame(width: 100, height: 100)
                    .border(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                
                
                Button(action: {
                    
                    guard let url = URL(string: data.coverageURL) else { return }
                    openURL(url)
                    
                }, label: {
                    Text(data.publishedBy)
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
