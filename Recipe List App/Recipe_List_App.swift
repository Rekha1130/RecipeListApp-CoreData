//
//  Recipe_List_App.swift
//  Recipe List App
//
//  Created by Rekha
//

import SwiftUI

@main
struct Recipe_List_App: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
