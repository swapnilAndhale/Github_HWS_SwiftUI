//
//  Personal_FinanceApp.swift
//  Personal Finance
//
//  Created by Swapnil on 25/09/22.
//

import SwiftUI

@main
struct Personal_FinanceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
