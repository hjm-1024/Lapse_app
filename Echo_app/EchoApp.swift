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
            // TODO: Replace with HomeView once implemented
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

// MARK: - Temporary ContentView
// This will be replaced by HomeView in the next implementation phase
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Echo")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Your Voice from the Past,\nWhen You Need It Most")
                .font(.callout)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Spacer()

            Text("🏗️ Core Architecture Ready")
                .font(.headline)

            Text("Next Steps:")
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(alignment: .leading, spacing: 8) {
                Label("Create HomeView", systemImage: "house.fill")
                Label("Create VibeComposerView", systemImage: "square.and.pencil")
                Label("Create RevelationView", systemImage: "sparkles")
                Label("Create SettingsView", systemImage: "gearshape.fill")
            }
            .font(.footnote)
            .foregroundColor(.secondary)

            Spacer()

            Text("Phase 3: Development Started")
                .font(.caption)
                .foregroundColor(.tertiary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
