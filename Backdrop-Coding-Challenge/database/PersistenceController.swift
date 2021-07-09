//
//  Persistence.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 09/07/2021.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "LikedCatsDatabase")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                let nserror = error as NSError
                completion(error)
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteContext(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in} ){
        let context = container.viewContext
        context.delete(object)
        saveContext(completion: completion)
    }
}
