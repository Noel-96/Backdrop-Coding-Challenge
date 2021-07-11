//
//  Backdrop_Coding_ChallengeTests.swift
//  Backdrop-Coding-ChallengeTests
//
//  Created by Noel Obaseki on 10/07/2021.
//

import XCTest
import CoreData
@testable import Backdrop_Coding_Challenge
class Backdrop_Coding_ChallengeTests: XCTestCase {
    var persistenceController: PersistenceController!
    var mock_catItemViewModel: CatItemViewModel!
    var mock_catListViewModel: CatListViewModel!
    var mock_likedCatItemViewModel: LikedCatItemViewModel!

    
    var mockPersistantContainer: NSPersistentContainer = {
     let container = NSPersistentContainer(name: "LikedCatsDatabase")
     container.loadPersistentStores(completionHandler: { _, error in
         if let error = error as NSError? {
             fatalError("Unresolved error \(error), \(error.userInfo)")
         }
     })
     return container
 }()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        persistenceController = PersistenceController.shared
        persistenceController.container = mockPersistantContainer
        
        mock_catItemViewModel = CatItemViewModel()
        mock_catListViewModel = CatListViewModel()
        mock_likedCatItemViewModel = LikedCatItemViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mock_catItemViewModel = nil
        mock_catListViewModel = nil
        mock_likedCatItemViewModel = nil
    }

    func test_init_persistenceController() {
        let instance = PersistenceController.shared
        /* Asserts that an expression is not nil.
         Generates a failure when expression == nil. */
        XCTAssertNotNil(instance)
    }
    
    
    func test_likeCatPicture (){
        let id = "test_id"
        let catName = "test_cat"
        let imageData = "Loading_Default_Picture".data(using: .utf8)!
        let mock_likedCat : LikedCat = LikedCat(context: mockPersistantContainer.viewContext)
        mock_catItemViewModel.likeCatPicture(id: id, catName: catName, imageData: imageData, isLiked: true, likedCat: mock_likedCat)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LikedCat")
        var entitiesCount = 0
        do {
            entitiesCount = try  mockPersistantContainer.viewContext.count(for: fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        XCTAssertGreaterThan(entitiesCount, 0)
    }
    

    func test_checkIfCatIsLiked(){
        let id = "test_id"
        let catName = "test_cat"
        let imageData = "Loading_Default_Picture".data(using: .utf8)!
        let likedCat : LikedCat = LikedCat(context: mockPersistantContainer.viewContext)
        mock_catItemViewModel.likeCatPicture(id: id, catName: catName, imageData: imageData, isLiked: true, likedCat: likedCat)
        XCTAssertTrue(mock_catItemViewModel.checkIfCatIsLiked(id: "test_id", managedObjectContext: mockPersistantContainer.viewContext))
    }
    
    
    func test_removeLikedCatPicture(){
        let id = "test_id"
        let catName = "test_cat"
        let imageData = "Loading_Default_Picture".data(using: .utf8)!
        let mock_likedCat : LikedCat = LikedCat(context: mockPersistantContainer.viewContext)
        mock_catItemViewModel.likeCatPicture(id: id, catName: catName, imageData: imageData, isLiked: true, likedCat: mock_likedCat)
        mock_likedCatItemViewModel.removeLikedCatPicture(likedCat: mock_likedCat)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LikedCat")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        var entitiesCount = 0
        do {
            entitiesCount = try  mockPersistantContainer.viewContext.count(for: fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        XCTAssertEqual(entitiesCount, 0)
    }
    
    
}
