//
//  CatItemViewModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 09/07/2021.
//

import Foundation
import Combine
import SwiftUI
import CoreData

final class CatItemViewModel: ObservableObject{
 
    func likeCatPicture(id: String, catName: String , imageData: Data, isLiked: Bool, likedCat: LikedCat) {
        likedCat.catName = catName
        likedCat.id = id
        likedCat.imageUrl = imageData
        likedCat.isLiked = isLiked
        PersistenceController.shared.saveContext()
        }
    
    func checkIfCatIsLiked(id: String, managedObjectContext: NSManagedObjectContext) -> Bool{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LikedCat")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        var entitiesCount = 0
        do {
            entitiesCount = try managedObjectContext.count(for: fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return entitiesCount > 0
    }
}
