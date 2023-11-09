//
//  Winston_PromPlannerApp.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-09-28.
//

import SwiftUI

@main
struct Winston_PromPlannerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            SplashScreenView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            EditView1()
        }
    }
}
