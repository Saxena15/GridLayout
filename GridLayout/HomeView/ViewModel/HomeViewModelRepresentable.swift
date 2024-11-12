//
//  HomeViewModelRepresentable.swift
//  GridLayout
//
//  Created by Akash on 12/11/24.
//

import Foundation


protocol HomeViewModelRepresentable {
    func fetchData(_ eventType: APIRouter, completion: (()->Void)?)
    func fetchImageURL(_ thumbnail: Thumbnail) -> String
}
