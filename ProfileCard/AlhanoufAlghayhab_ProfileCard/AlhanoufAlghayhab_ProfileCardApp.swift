//
//  AlhanoufAlghayhab_ProfileCardApp.swift
//  AlhanoufAlghayhab_ProfileCard
//
//  Created by administrator on 08/11/2021.
//

import SwiftUI

@main
struct AlhanoufAlghayhab_ProfileCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
