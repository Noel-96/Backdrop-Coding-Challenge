//
//  LikedCatItemViewModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 09/07/2021.
//

import Foundation
import Combine

final class LikedCatItemViewModel: ObservableObject{
    
    func removeLikedCatPicture(likedCat: LikedCat){
        PersistenceController.shared.deleteContext(likedCat)
    }
    
}
