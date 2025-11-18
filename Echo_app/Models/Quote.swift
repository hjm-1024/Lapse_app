//
//  Quote.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation

/// Represents an inspirational quote from the local database
/// Based on SRS Section 4.4 - Quote Database and Matching Engine
struct Quote: Codable, Identifiable {
    let id: String
    let text: String
    let author: String
    let source: String
    let emotionTags: [Emotion]
    let category: QuoteCategory

    /// Quote category for organizational purposes
    enum QuoteCategory: String, Codable {
        case stoicism = "Stoicism"
        case mindfulness = "Mindfulness"
        case psychology = "Psychology"
        case literature = "Literature"
        case philosophy = "Philosophy"
        case science = "Science"
    }

    /// Formatted quote with attribution
    /// Example: "The impediment to action...\n— Marcus Aurelius"
    var formattedText: String {
        return "\"\(text)\"\n\n— \(author)"
    }

    /// Check if quote matches given emotion
    func matches(emotion: Emotion) -> Bool {
        return emotionTags.contains(emotion)
    }
}

/// Extension for loading quotes from JSON
extension Quote {
    /// Sample quotes for testing (before full database is loaded)
    static let sampleQuotes: [Quote] = [
        Quote(
            id: "q001",
            text: "The impediment to action advances action. What stands in the way becomes the way.",
            author: "Marcus Aurelius",
            source: "Meditations",
            emotionTags: [.struggle, .motivation, .reflection],
            category: .stoicism
        ),
        Quote(
            id: "q002",
            text: "You are not your thoughts. You are the observer of your thoughts.",
            author: "Amit Ray",
            source: "Mindfulness Meditation",
            emotionTags: [.comfort, .reflection],
            category: .mindfulness
        ),
        Quote(
            id: "q003",
            text: "What we think, we become.",
            author: "Buddha",
            source: "Buddhist Teachings",
            emotionTags: [.hope, .motivation, .reflection],
            category: .philosophy
        ),
        Quote(
            id: "q004",
            text: "The only way out is through.",
            author: "Robert Frost",
            source: "A Servant to Servants",
            emotionTags: [.struggle, .courage, .motivation],
            category: .literature
        ),
        Quote(
            id: "q005",
            text: "Gratitude turns what we have into enough.",
            author: "Aesop",
            source: "Fables",
            emotionTags: [.gratitude, .joy],
            category: .philosophy
        ),
        Quote(
            id: "q006",
            text: "You have within you right now, everything you need to deal with whatever the world throws at you.",
            author: "Brian Tracy",
            source: "Self-Development",
            emotionTags: [.comfort, .motivation, .hope],
            category: .psychology
        ),
        Quote(
            id: "q007",
            text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
            author: "Winston Churchill",
            source: "Speech",
            emotionTags: [.achievement, .motivation, .struggle],
            category: .philosophy
        ),
        Quote(
            id: "q008",
            text: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
            author: "Nelson Mandela",
            source: "Long Walk to Freedom",
            emotionTags: [.struggle, .hope, .achievement],
            category: .philosophy
        )
    ]
}
