//
//  EchoApp.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import SwiftUI
import SwiftData

/// Main app entry point
/// Based on Phase3_ProjectSetup.md Section 3
@main
struct EchoApp: App {
    /// SwiftData model container for persisting Vibes
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Vibe.self,
        ])

        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
