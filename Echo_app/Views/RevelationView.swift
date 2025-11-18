//
//  RevelationView.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import SwiftUI
import SwiftData

/// Revelation screen displaying delivered Echo with recommendation and quote
/// Based on SRS Section 3.2.3 - Screen 3: Revelation
/// Wireframes: docs/Wireframes.md Section 2.3
struct RevelationView: View {
    @Environment(\.dismiss) private var dismiss
    let vibe: Vibe

    @State private var recommendation: String = ""
    @State private var quote: Quote?

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBackground")
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 32) {
                        // MARK: - Header
                        headerSection
                            .padding(.top, 24)

                        // MARK: - Original Message
                        originalMessageSection

                        // MARK: - AI Recommendation
                        recommendationSection

                        // MARK: - Quote
                        if let quote = quote {
                            quoteSection(quote)
                        }

                        // MARK: - Done Button
                        doneButton
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationTitle("Echo Arrived")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                loadContent()
            }
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "sparkles")
                .font(.system(size: 56))
                .foregroundColor(Color(hex: vibe.emotion.colorHex))
                .padding(.bottom, 8)

            Text("An Echo has arrived")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("PrimaryText"))

            Text("From \(formatPastDate(vibe.createdDate))")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color("SecondaryText"))
        }
    }

    // MARK: - Original Message Section
    private var originalMessageSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: vibe.emotion.iconName)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: vibe.emotion.colorHex))

                Text(vibe.emotion.label)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("PrimaryText"))

                Spacer()

                Text(vibe.interval.label + " ago")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color("SecondaryText"))
            }

            Text(vibe.text)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("PrimaryText"))
                .lineSpacing(6)
                .padding(.top, 8)
        }
        .padding(20)
        .background(Color("SecondaryBackground"))
        .cornerRadius(16)
    }

    // MARK: - Recommendation Section
    private var recommendationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "wand.and.stars")
                    .font(.system(size: 16))
                    .foregroundColor(Color("AccentBlue"))

                Text("Reflection")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("PrimaryText"))
            }

            Text(recommendation.isEmpty ? "Generating..." : recommendation)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("PrimaryText"))
                .lineSpacing(6)
                .padding(.top, 8)
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color("AccentBlue").opacity(0.1), Color("AccentBlue").opacity(0.05)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color("AccentBlue").opacity(0.2), lineWidth: 1)
        )
    }

    // MARK: - Quote Section
    private func quoteSection(_ quote: Quote) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "quote.bubble")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: vibe.emotion.colorHex))

                Text("Wisdom")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("PrimaryText"))

                Spacer()

                Text(quote.category.korean)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("TertiaryText"))
            }

            VStack(alignment: .leading, spacing: 16) {
                // English quote
                Text(quote.textEn)
                    .font(.system(size: 17, weight: .regular, design: .serif))
                    .foregroundColor(Color("PrimaryText"))
                    .italic()
                    .lineSpacing(6)

                // Korean quote
                Text(quote.textKo)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(Color("SecondaryText"))
                    .lineSpacing(5)

                // Author
                HStack(spacing: 4) {
                    Text("— \(quote.author)")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color("SecondaryText"))

                    if let authorKo = quote.authorKo {
                        Text("(\(authorKo))")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Color("TertiaryText"))
                    }
                }
            }
            .padding(.top, 8)
        }
        .padding(20)
        .background(Color("SecondaryBackground"))
        .cornerRadius(16)
    }

    // MARK: - Done Button
    private var doneButton: some View {
        Button(action: {
            vibe.markAsDelivered()
            dismiss()
        }) {
            HStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 20))
                Text("Done")
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

    // MARK: - Load Content
    private func loadContent() {
        // Generate AI recommendation
        recommendation = RecommendationService.shared.generateRecommendation(for: vibe)

        // Load matching quote
        quote = QuoteService.shared.getQuote(for: vibe.emotion)
    }

    // MARK: - Date Formatting
    private func formatPastDate(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

// MARK: - Preview
#Preview {
    let sampleVibe = Vibe(
        text: "I finished my first marathon today! Feeling proud and exhausted. This is a major milestone in my fitness journey.",
        emotion: .achievement,
        interval: .sevenDays
    )

    return RevelationView(vibe: sampleVibe)
        .modelContainer(for: Vibe.self, inMemory: true)
}

#Preview("Comfort Emotion") {
    let sampleVibe = Vibe(
        text: "Feeling anxious about the big presentation tomorrow. I hope I can do well and make my team proud.",
        emotion: .comfort,
        interval: .threeDays
    )

    return RevelationView(vibe: sampleVibe)
        .modelContainer(for: Vibe.self, inMemory: true)
}

#Preview("Gratitude Emotion") {
    let sampleVibe = Vibe(
        text: "So grateful for my family's support during this difficult time. They've been my rock.",
        emotion: .gratitude,
        interval: .thirtyDays
    )

    return RevelationView(vibe: sampleVibe)
        .modelContainer(for: Vibe.self, inMemory: true)
}
