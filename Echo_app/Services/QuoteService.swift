//
//  QuoteService.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation

/// Service responsible for loading and matching quotes from local database
/// Based on SRS Section 4.4 - Quote Database and Matching Engine
final class QuoteService {
    static let shared = QuoteService()

    private var quotes: [Quote] = []
    private var isLoaded = false

    private init() {}

    // MARK: - Loading

    /// Load quotes from JSON file in app bundle
    /// Based on SRS Section 4.4 - QM-001: Quote database must load synchronously on app launch
    func loadQuotes() {
        guard !isLoaded else { return }

        // Try to load from bundle
        if let url = Bundle.main.url(forResource: "quotes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let quoteResponse = try decoder.decode(QuoteResponse.self, from: data)
                self.quotes = quoteResponse.quotes
                self.isLoaded = true
                print("✅ Loaded \(quotes.count) quotes from database")
            } catch {
                print("⚠️ Failed to load quotes from JSON: \(error.localizedDescription)")
                loadSampleQuotes()
            }
        } else {
            print("⚠️ quotes.json not found in bundle, using sample quotes")
            loadSampleQuotes()
        }
    }

    /// Load sample quotes as fallback
    /// Based on SRS Section 5.2 - SAFE-003: Graceful Degradation
    private func loadSampleQuotes() {
        self.quotes = Quote.sampleQuotes
        self.isLoaded = true
        print("ℹ️ Using \(quotes.count) sample quotes")
    }

    // MARK: - Matching

    /// Get a random quote matching the given emotion
    /// Based on SRS Section 3.3 - FR-005: Quote Matching
    /// - Parameter emotion: The emotion to match
    /// - Returns: A random quote that matches the emotion, or fallback to Reflection category
    func getQuote(for emotion: Emotion) -> Quote? {
        guard isLoaded else {
            loadQuotes()
        }

        // Filter quotes by emotion
        let matchingQuotes = quotes.filter { $0.matches(emotion: emotion) }

        if let randomQuote = matchingQuotes.randomElement() {
            return randomQuote
        } else {
            // Fallback to Reflection category
            // Based on SRS Section 4.4 - QM-002: Fallback to "Reflection" category (generic)
            print("⚠️ No quotes found for emotion: \(emotion.rawValue), using Reflection fallback")
            return quotes.filter { $0.matches(emotion: .reflection) }.randomElement()
        }
    }

    /// Get all quotes (for testing/debugging)
    func getAllQuotes() -> [Quote] {
        guard isLoaded else {
            loadQuotes()
            return quotes
        }
        return quotes
    }

    /// Get quotes by category
    func getQuotes(by category: Quote.QuoteCategory) -> [Quote] {
        return quotes.filter { $0.category == category }
    }

    /// Get total quote count
    var count: Int {
        return quotes.count
    }
}

// MARK: - JSON Response Structure
private struct QuoteResponse: Codable {
    let quotes: [Quote]
}
