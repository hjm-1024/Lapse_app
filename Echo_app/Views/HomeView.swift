//
//  HomeView.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import SwiftUI
import SwiftData

/// Primary home screen showing scheduled Echoes and creation CTA
/// Based on SRS Section 3.2.1 - Screen 1: Home
/// Wireframes: docs/Wireframes.md Section 2.1
struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Vibe.deliveryDate, order: .forward) private var vibes: [Vibe]

    @State private var showingComposer = false

    /// Pending (undelivered) Vibes only
    private var scheduledEchoes: [Vibe] {
        vibes.filter { !$0.isDelivered }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBackground")
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // MARK: - Header
                    headerSection
                        .padding(.top, 20)
                        .padding(.bottom, 32)

                    // MARK: - Primary CTA
                    createEchoButton
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)

                    // MARK: - Scheduled Echoes List
                    if scheduledEchoes.isEmpty {
                        emptyState
                    } else {
                        scheduledEchoesList
                    }

                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("SecondaryText"))
                    }
                }
            }
            .sheet(isPresented: $showingComposer) {
                VibeComposerView()
            }
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("Echo")
                .font(.system(size: 34, weight: .bold, design: .default))
                .foregroundColor(Color("PrimaryText"))

            Text("Your Voice from the Past,\nWhen You Need It Most")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color("SecondaryText"))
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
    }

    // MARK: - Create Echo Button
    private var createEchoButton: some View {
        Button(action: {
            showingComposer = true
        }) {
            HStack(spacing: 8) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 20))
                Text("Create an Echo")
                    .font(.system(size: 17, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color("AccentBlue"))
            .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Empty State
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
                .foregroundColor(Color("TertiaryText"))
                .padding(.bottom, 8)

            Text("No Scheduled Echoes")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("PrimaryText"))

            Text("Create your first Echo to send a message to your future self")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color("SecondaryText"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding(.top, 60)
    }

    // MARK: - Scheduled Echoes List
    private var scheduledEchoesList: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Scheduled Echoes")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("PrimaryText"))
                .padding(.horizontal, 24)
                .padding(.bottom, 16)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(scheduledEchoes) { vibe in
                        ScheduledEchoRow(vibe: vibe)
                            .padding(.horizontal, 24)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

// MARK: - Scheduled Echo Row
struct ScheduledEchoRow: View {
    let vibe: Vibe

    var body: some View {
        HStack(spacing: 12) {
            // Emotion icon
            Image(systemName: vibe.emotion.iconName)
                .font(.system(size: 24))
                .foregroundColor(Color(hex: vibe.emotion.colorHex))
                .frame(width: 48, height: 48)
                .background(Color(hex: vibe.emotion.colorHex).opacity(0.15))
                .cornerRadius(12)

            // Text content
            VStack(alignment: .leading, spacing: 4) {
                Text(vibe.previewText)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color("PrimaryText"))
                    .lineLimit(2)

                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 12))
                    Text("in \(vibe.daysUntilDelivery) days")
                        .font(.system(size: 13, weight: .regular))
                }
                .foregroundColor(Color("SecondaryText"))
            }

            Spacer()

            // Chevron
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color("TertiaryText"))
        }
        .padding(16)
        .background(Color("SecondaryBackground"))
        .cornerRadius(16)
    }
}

// MARK: - Color Extension for Hex Support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview
#Preview {
    HomeView()
        .modelContainer(for: Vibe.self, inMemory: true)
}

#Preview("With Echoes") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Vibe.self, configurations: config)

    // Add sample data
    let vibe1 = Vibe(text: "I finished my first marathon today! Feeling proud and exhausted.", emotion: .achievement, interval: .sevenDays)
    let vibe2 = Vibe(text: "Nervous about the presentation tomorrow.", emotion: .comfort, interval: .threeDays)
    let vibe3 = Vibe(text: "Grateful for my family's support.", emotion: .gratitude, interval: .thirtyDays)

    container.mainContext.insert(vibe1)
    container.mainContext.insert(vibe2)
    container.mainContext.insert(vibe3)

    return HomeView()
        .modelContainer(container)
}
