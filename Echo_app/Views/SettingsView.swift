//
//  SettingsView.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import SwiftUI
import SwiftData
import UIKit

/// Settings screen for app preferences and information
/// Based on SRS Section 3.2.4 - Screen 4: Settings
/// Wireframes: docs/Wireframes.md Section 2.4
struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var notificationsEnabled: Bool = false
    @State private var showingClearDataAlert: Bool = false
    @State private var showingAbout: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBackground")
                    .ignoresSafeArea()

                List {
                    // MARK: - Notifications Section
                    Section {
                        HStack {
                            Image(systemName: "bell.fill")
                                .font(.system(size: 16))
                                .foregroundColor(Color("AccentBlue"))
                                .frame(width: 24)

                            Text("Notifications")
                                .font(.system(size: 17))
                                .foregroundColor(Color("PrimaryText"))

                            Spacer()

                            Toggle("", isOn: $notificationsEnabled)
                                .labelsHidden()
                                .onChange(of: notificationsEnabled) { _, newValue in
                                    handleNotificationToggle(newValue)
                                }
                        }

                        Text("Enable notifications to receive your Echoes at 9:00 AM local time")
                            .font(.system(size: 13))
                            .foregroundColor(Color("SecondaryText"))
                    } header: {
                        Text("Preferences")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color("SecondaryText"))
                    }

                    // MARK: - Data Section
                    Section {
                        Button(action: {
                            showingClearDataAlert = true
                        }) {
                            HStack {
                                Image(systemName: "trash.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("WarningOrange"))
                                    .frame(width: 24)

                                Text("Clear All Data")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color("WarningOrange"))
                            }
                        }
                    } header: {
                        Text("Data")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color("SecondaryText"))
                    }

                    // MARK: - About Section
                    Section {
                        Button(action: {
                            showingAbout = true
                        }) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("AccentBlue"))
                                    .frame(width: 24)

                                Text("About Echo")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color("PrimaryText"))

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color("TertiaryText"))
                            }
                        }

                        HStack {
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 16))
                                .foregroundColor(Color("AccentBlue"))
                                .frame(width: 24)

                            Text("Privacy Policy")
                                .font(.system(size: 17))
                                .foregroundColor(Color("PrimaryText"))

                            Spacer()

                            Image(systemName: "arrow.up.forward")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("TertiaryText"))
                        }

                        HStack {
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 16))
                                .foregroundColor(Color("AccentBlue"))
                                .frame(width: 24)

                            Text("Terms of Service")
                                .font(.system(size: 17))
                                .foregroundColor(Color("PrimaryText"))

                            Spacer()

                            Image(systemName: "arrow.up.forward")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("TertiaryText"))
                        }
                    } header: {
                        Text("Information")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color("SecondaryText"))
                    }

                    // MARK: - Version Section
                    Section {
                        HStack {
                            Text("Version")
                                .font(.system(size: 17))
                                .foregroundColor(Color("PrimaryText"))

                            Spacer()

                            Text("1.0.0")
                                .font(.system(size: 17))
                                .foregroundColor(Color("SecondaryText"))
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color("AccentBlue"))
                }
            }
            .onAppear {
                checkNotificationStatus()
            }
            .alert("Clear All Data", isPresented: $showingClearDataAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Clear", role: .destructive) {
                    clearAllData()
                }
            } message: {
                Text("This will permanently delete all your Echoes. This action cannot be undone.")
            }
            .sheet(isPresented: $showingAbout) {
                AboutView()
            }
        }
    }

    // MARK: - Notification Handling
    private func checkNotificationStatus() {
        Task {
            let settings = await UNUserNotificationCenter.current().notificationSettings()
            await MainActor.run {
                notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }

    private func handleNotificationToggle(_ enabled: Bool) {
        if enabled {
            Task {
                let granted = await NotificationService.shared.requestAuthorization()
                if !granted {
                    await MainActor.run {
                        notificationsEnabled = false
                    }
                }
            }
        } else {
            // Note: Cannot programmatically disable notifications
            // User must do this in Settings app
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }
    }

    // MARK: - Clear Data
    private func clearAllData() {
        // Cancel all pending notifications
        Task {
            await NotificationService.shared.cancelAllNotifications()
        }

        // Delete all Vibes from database
        do {
            try modelContext.delete(model: Vibe.self)
            try modelContext.save()
        } catch {
            print("Error clearing data: \(error)")
        }
    }
}

// MARK: - About View
struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBackground")
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // App icon placeholder
                        Image(systemName: "sparkles")
                            .font(.system(size: 72))
                            .foregroundColor(Color("AccentBlue"))
                            .padding(.top, 40)

                        Text("Echo")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(Color("PrimaryText"))

                        Text("Version 1.0.0")
                            .font(.system(size: 15))
                            .foregroundColor(Color("SecondaryText"))

                        Divider()
                            .padding(.vertical, 16)

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Your Voice from the Past, When You Need It Most")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Color("PrimaryText"))
                                .multilineTextAlignment(.center)

                            Text("Echo is a time-delayed messaging app that helps you send messages to your future self. Based on the Ebbinghaus forgetting curve, Echo delivers your thoughts at scientifically optimal intervals to maximize emotional impact and memory retention.")
                                .font(.system(size: 15))
                                .foregroundColor(Color("SecondaryText"))
                                .lineSpacing(4)
                                .multilineTextAlignment(.center)

                            Text("100% Privacy-First")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Color("PrimaryText"))
                                .multilineTextAlignment(.center)
                                .padding(.top, 16)

                            Text("All your data is stored locally on your device. No cloud sync, no servers, no tracking. Your thoughts belong to you alone.")
                                .font(.system(size: 15))
                                .foregroundColor(Color("SecondaryText"))
                                .lineSpacing(4)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 32)

                        Divider()
                            .padding(.vertical, 16)

                        Text("© 2025 Echo Development Team")
                            .font(.system(size: 13))
                            .foregroundColor(Color("TertiaryText"))

                        Text("Built with SwiftUI & SwiftData")
                            .font(.system(size: 13))
                            .foregroundColor(Color("TertiaryText"))
                            .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color("AccentBlue"))
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    SettingsView()
        .modelContainer(for: Vibe.self, inMemory: true)
}

#Preview("About View") {
    AboutView()
}
