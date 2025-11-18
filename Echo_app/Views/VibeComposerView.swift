//
//  VibeComposerView.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import SwiftUI
import SwiftData

/// Composer screen for creating new Echoes (Vibes)
/// Based on SRS Section 3.2.2 - Screen 2: Vibe Composer
/// Wireframes: docs/Wireframes.md Section 2.2
struct VibeComposerView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var text: String = ""
    @State private var selectedEmotion: Emotion = .achievement
    @State private var selectedInterval: EbbinghausInterval = .sevenDays
    @State private var showingValidationError: Bool = false

    private let characterLimit = 280
    private let warningThreshold = 251

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBackground")
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 32) {
                        // MARK: - Text Input Section
                        textInputSection
                            .padding(.top, 24)

                        // MARK: - Emotion Selector
                        emotionSelector

                        // MARK: - Interval Selector
                        intervalSelector

                        // MARK: - Save Button
                        saveButton
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationTitle("Create an Echo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color("AccentBlue"))
                }
            }
            .alert("Invalid Echo", isPresented: $showingValidationError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please enter between 1 and 280 characters.")
            }
        }
    }

    // MARK: - Text Input Section
    private var textInputSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your Message")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color("PrimaryText"))

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text("What do you want to remember?")
                        .font(.system(size: 17))
                        .foregroundColor(Color("TertiaryText"))
                        .padding(.top, 8)
                        .padding(.leading, 4)
                }

                TextEditor(text: $text)
                    .font(.system(size: 17))
                    .foregroundColor(Color("PrimaryText"))
                    .frame(minHeight: 120)
                    .scrollContentBackground(.hidden)
                    .onChange(of: text) { _, newValue in
                        if newValue.count > characterLimit {
                            text = String(newValue.prefix(characterLimit))
                        }
                    }
            }
            .padding(12)
            .background(Color("SecondaryBackground"))
            .cornerRadius(12)

            // Character counter
            HStack {
                Spacer()
                Text("\(text.count)/\(characterLimit)")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(text.count >= warningThreshold ? Color("WarningOrange") : Color("SecondaryText"))
            }
        }
    }

    // MARK: - Emotion Selector
    private var emotionSelector: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("How do you feel?")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color("PrimaryText"))

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(Emotion.allCases, id: \.self) { emotion in
                    EmotionChip(
                        emotion: emotion,
                        isSelected: selectedEmotion == emotion,
                        action: { selectedEmotion = emotion }
                    )
                }
            }
        }
    }

    // MARK: - Interval Selector
    private var intervalSelector: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("When should it arrive?")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color("PrimaryText"))

            VStack(spacing: 8) {
                ForEach(EbbinghausInterval.allCases, id: \.self) { interval in
                    IntervalRow(
                        interval: interval,
                        isSelected: selectedInterval == interval,
                        action: { selectedInterval = interval }
                    )
                }
            }
        }
    }

    // MARK: - Save Button
    private var saveButton: some View {
        Button(action: saveVibe) {
            HStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 20))
                Text("Save Echo")
                    .font(.system(size: 17, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(text.isEmpty ? Color("TertiaryText") : Color("AccentBlue"))
            .cornerRadius(16)
        }
        .disabled(text.isEmpty)
        .buttonStyle(.plain)
    }

    // MARK: - Save Logic
    private func saveVibe() {
        guard Vibe.isValidTextLength(text) else {
            showingValidationError = true
            return
        }

        let newVibe = Vibe(text: text, emotion: selectedEmotion, interval: selectedInterval)
        modelContext.insert(newVibe)

        // Schedule notification
        Task {
            if let notificationID = await NotificationService.shared.scheduleNotification(for: newVibe) {
                newVibe.notificationID = notificationID
            }
        }

        dismiss()
    }
}

// MARK: - Emotion Chip Component
struct EmotionChip: View {
    let emotion: Emotion
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: emotion.iconName)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .white : Color(hex: emotion.colorHex))
                    .frame(width: 48, height: 48)
                    .background(isSelected ? Color(hex: emotion.colorHex) : Color(hex: emotion.colorHex).opacity(0.15))
                    .cornerRadius(12)

                Text(emotion.label)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Color("PrimaryText"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Interval Row Component
struct IntervalRow: View {
    let interval: EbbinghausInterval
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                // Radio button
                ZStack {
                    Circle()
                        .strokeBorder(isSelected ? Color("AccentBlue") : Color("TertiaryText"), lineWidth: 2)
                        .frame(width: 20, height: 20)

                    if isSelected {
                        Circle()
                            .fill(Color("AccentBlue"))
                            .frame(width: 12, height: 12)
                    }
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(interval.label)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("PrimaryText"))

                    Text(interval.useCase)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color("SecondaryText"))
                        .lineLimit(1)
                }

                Spacer()
            }
            .padding(16)
            .background(isSelected ? Color("AccentBlue").opacity(0.1) : Color("SecondaryBackground"))
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    VibeComposerView()
        .modelContainer(for: Vibe.self, inMemory: true)
}
