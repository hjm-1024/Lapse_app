//
//  EbbinghausInterval.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation

/// Represents the 5 scientifically-derived time intervals based on Ebbinghaus Forgetting Curve
/// Based on SRS Section 4.2 - Ebbinghaus-Based Scheduling System
enum EbbinghausInterval: String, Codable, CaseIterable {
    case oneDay = "1d"
    case threeDays = "3d"
    case sevenDays = "7d"
    case thirtyDays = "30d"
    case ninetyDays = "90d"

    /// Number of days to add to current date
    var days: Int {
        switch self {
        case .oneDay:
            return 1
        case .threeDays:
            return 3
        case .sevenDays:
            return 7
        case .thirtyDays:
            return 30
        case .ninetyDays:
            return 90
        }
    }

    /// User-facing label
    var label: String {
        switch self {
        case .oneDay:
            return "1 day"
        case .threeDays:
            return "3 days"
        case .sevenDays:
            return "7 days"
        case .thirtyDays:
            return "30 days"
        case .ninetyDays:
            return "90 days"
        }
    }

    /// Scientific rationale for this interval
    /// Based on SRS Section 4.2 - Ebbinghaus Interval Justifications
    var rationale: String {
        switch self {
        case .oneDay:
            return "Immediate reinforcement during memory consolidation phase"
        case .threeDays:
            return "Short-term memory retention peak"
        case .sevenDays:
            return "Weekly rhythm, before significant decay begins"
        case .thirtyDays:
            return "Monthly milestone, long-term memory reinforcement"
        case .ninetyDays:
            return "Quarterly perspective, spaced repetition for retention"
        }
    }

    /// Primary use case
    var useCase: String {
        switch self {
        case .oneDay:
            return "Daily affirmations, next-day reminders"
        case .threeDays:
            return "Pre-event preparation"
        case .sevenDays:
            return "Weekly goals, habit tracking"
        case .thirtyDays:
            return "Monthly reviews, seasonal goals"
        case .ninetyDays:
            return "Major life reflections, long-term resilience"
        }
    }

    /// Calculate delivery date from current date
    /// Based on SRS Section 4.2 - Algorithm Pseudocode
    /// - Returns: Date at 9:00 AM after adding interval days
    func calculateDeliveryDate(from baseDate: Date = Date()) -> Date {
        let calendar = Calendar.current

        // Add days to current date
        guard let deliveryDate = calendar.date(byAdding: .day, value: days, to: baseDate) else {
            return baseDate
        }

        // Set delivery time to 9:00 AM (local timezone)
        // Based on SRS BR-003: Notification Delivery Time Fixed at 09:00
        guard let deliveryAt9AM = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: deliveryDate) else {
            return deliveryDate
        }

        return deliveryAt9AM
    }
}
