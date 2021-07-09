//
//  Backdrop_Coding_ChallengeApp.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 03/07/2021.
//

import SwiftUI

@main
struct Backdrop_Coding_ChallengeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase{
            case .background:
                print("background")
                persistenceController.saveContext()
            case .inactive:
                print("inactive")
            case .active:
                print("active")
            @unknown default:
                print("something must have changed")
            }
        }
    }
}
