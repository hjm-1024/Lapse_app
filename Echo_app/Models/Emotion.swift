//
//  Emotion.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation

/// Represents the 8 core emotional contexts for Vibes
/// Based on SRS Section 4.1 - Emotion Categories
enum Emotion: String, Codable, CaseIterable {
    case achievement = "Achievement"
    case comfort = "Comfort"
    case motivation = "Motivation"
    case gratitude = "Gratitude"
    case struggle = "Struggle"
    case joy = "Joy"
    case reflection = "Reflection"
    case hope = "Hope"

    /// SF Symbol icon name for this emotion
    /// Based on Design_System.md Section 5.2
    var iconName: String {
        switch self {
        case .achievement:
            return "trophy.fill"
        case .comfort:
            return "heart.circle.fill"
        case .motivation:
            return "flame.fill"
        case .gratitude:
            return "sparkles"
        case .struggle:
            return "mountain.2.fill"
        case .joy:
            return "sun.max.fill"
        case .reflection:
            return "book.closed.fill"
        case .hope:
            return "leaf.fill"
        }
    }

    /// Emotion-specific color (hex code)
    /// Based on Design_System.md Section 2.2
    var colorHex: String {
        switch self {
        case .achievement:
            return "#FFD60A" // Gold
        case .comfort:
            return "#64D2FF" // Sky Blue
        case .motivation:
            return "#FF453A" // Energetic Red
        case .gratitude:
            return "#BF5AF2" // Purple
        case .struggle:
            return "#AC8E68" // Muted Brown
        case .joy:
            return "#FF9F0A" // Orange
        case .reflection:
            return "#5E5CE6" // Indigo
        case .hope:
            return "#32D74B" // Green
        }
    }

    /// User-facing description
    var description: String {
        switch self {
        case .achievement:
            return "Celebrating wins, accomplishments, milestones"
        case .comfort:
            return "Self-soothing for anxiety, stress, difficult times"
        case .motivation:
            return "Encouragement for upcoming challenges, goals"
        case .gratitude:
            return "Appreciation, thankfulness, positive moments"
        case .struggle:
            return "Acknowledging hardship, processing difficulty"
        case .joy:
            return "Pure happiness, excitement, positive energy"
        case .reflection:
            return "Thoughtful introspection, learning moments"
        case .hope:
            return "Optimism for future, aspirational thoughts"
        }
    }
}
