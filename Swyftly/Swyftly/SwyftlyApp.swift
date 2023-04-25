//
//  SwyftlyApp.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import SwiftUI

@main
struct SwyftlyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
