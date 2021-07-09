//
//  CatItemViewModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 09/07/2021.
//

import Foundation
import Combine
import SwiftUI

final class CatItemViewModel: ObservableObject{
    @Published var isCatLiked = false
    //@Environment(\.managedObjectContext) var managedObjectContext
 
    
    func likeCatPicture(id: String, catName: String , imageData: Data, isLiked: Bool, likedCat: LikedCat) {
        isCatLiked.toggle()
    
        likedCat.catName = catName
        likedCat.id = id
        likedCat.imageUrl = imageData
        likedCat.isLiked = isLiked
        PersistenceController.shared.saveContext()
        }
}
