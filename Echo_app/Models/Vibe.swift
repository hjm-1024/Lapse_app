//
//  Vibe.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation
import SwiftData

/// SwiftData model representing a user's time-delayed message
/// Based on SRS Section 3.1.3 - SW-001: SwiftData Framework
@Model
final class Vibe {
    /// Unique identifier
    var id: UUID

    /// User-generated text content (max 280 characters)
    /// Based on SRS BR-004: 280-Character Hard Limit
    var text: String

    /// Emotional context selected by user
    var emotion: Emotion

    /// Time interval selected for delivery
    var interval: EbbinghausInterval

    /// Date when Vibe was created
    var createdDate: Date

    /// Calculated delivery date (createdDate + interval)
    var deliveryDate: Date

    /// Whether the Vibe has been delivered to user
    var isDelivered: Bool

    /// Notification ID (for cancellation if needed)
    var notificationID: String?

    /// Initializer
    /// - Parameters:
    ///   - text: User's message (1-280 characters)
    ///   - emotion: Emotional context
    ///   - interval: Time interval for delivery
    init(text: String, emotion: Emotion, interval: EbbinghausInterval) {
        self.id = UUID()
        self.text = text
        self.emotion = emotion
        self.interval = interval
        self.createdDate = Date()
        self.deliveryDate = interval.calculateDeliveryDate(from: Date())
        self.isDelivered = false
        self.notificationID = nil
    }

    /// Computed property: Days until delivery
    var daysUntilDelivery: Int {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day], from: now, to: deliveryDate)
        return max(0, components.day ?? 0)
    }

    /// Computed property: Formatted delivery date string
    /// Example: "November 25, 2025 at 9:00 AM"
    var formattedDeliveryDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: deliveryDate)
    }

    /// Computed property: Preview text (first 30 characters)
    /// Used in Scheduled Echoes list
    var previewText: String {
        if text.count <= 30 {
            return text
        }
        let index = text.index(text.startIndex, offsetBy: 30)
        return String(text[..<index]) + "..."
    }

    /// Computed property: Notification body (first 50 characters)
    /// Based on SRS Section 3.1.3 - SW-002: Notification Payload
    var notificationBody: String {
        if text.count <= 50 {
            return text
        }
        let index = text.index(text.startIndex, offsetBy: 50)
        return String(text[..<index]) + "..."
    }

    /// Mark Vibe as delivered
    func markAsDelivered() {
        isDelivered = true
    }

    /// Validate text length
    /// Based on SRS Section 4.1 - VR-001
    static func isValidTextLength(_ text: String) -> Bool {
        return text.count >= 1 && text.count <= 280
    }
}

// MARK: - Sample Data for Preview
extension Vibe {
    /// Sample Vibe for SwiftUI previews and testing
    static var sample: Vibe {
        Vibe(
            text: "I finished my first marathon today! Feeling proud and exhausted.",
            emotion: .achievement,
            interval: .sevenDays
        )
    }

    /// Sample array for previews
    static var sampleArray: [Vibe] {
        [
            Vibe(text: "I finished my first marathon today!", emotion: .achievement, interval: .sevenDays),
            Vibe(text: "Nervous about the presentation tomorrow.", emotion: .comfort, interval: .threeDays),
            Vibe(text: "Grateful for my family's support.", emotion: .gratitude, interval: .thirtyDays),
            Vibe(text: "Starting a new chapter in my life.", emotion: .hope, interval: .ninetyDays)
        ]
    }
}
