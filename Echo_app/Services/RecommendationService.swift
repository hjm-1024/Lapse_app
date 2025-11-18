//
//  RecommendationService.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation
import NaturalLanguage

/// Service responsible for generating template-based smart recommendations
/// Based on SRS Section 4.3 - Template-Based Smart Recommendations
final class RecommendationService {
    static let shared = RecommendationService()

    private var templates: [Emotion: [String]] = [:]
    private var isLoaded = false

    private init() {}

    // MARK: - Loading

    /// Load templates from JSON file
    /// Based on SRS Section 4.3 - SR-001: Template bank must be stored in JSON file
    func loadTemplates() {
        guard !isLoaded else { return }

        // Try to load from bundle
        if let url = Bundle.main.url(forResource: "templates", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let templateResponse = try decoder.decode(TemplateResponse.self, from: data)
                self.templates = templateResponse.templates
                self.isLoaded = true
                print("✅ Loaded templates for \(templates.keys.count) emotions")
            } catch {
                print("⚠️ Failed to load templates from JSON: \(error.localizedDescription)")
                loadSampleTemplates()
            }
        } else {
            print("⚠️ templates.json not found in bundle, using sample templates")
            loadSampleTemplates()
        }
    }

    /// Load sample templates as fallback
    /// Based on SRS Section 4.3 - Template Structure Example
    private func loadSampleTemplates() {
        templates = [
            .achievement: [
                "This moment of {keyword} shows your true capability.",
                "Remember the strength it took to achieve {keyword}.",
                "Let this {keyword} remind you what you're capable of.",
                "You've proven yourself with {keyword}. Trust that strength.",
                "This accomplishment isn't luck—it's the result of your effort.",
                "Carry the confidence from this {keyword} forward.",
                "You did it once. You can do it again.",
                "This {keyword} is evidence of your growth.",
                "Celebrate this win. You've earned it.",
                "Your past self would be proud of this {keyword}."
            ],
            .comfort: [
                "You've survived challenges before. You'll survive this too.",
                "Be gentle with yourself during {keyword}.",
                "This difficult {keyword} is temporary. You are resilient.",
                "Trust the process. You're stronger than you think.",
                "It's okay to struggle. Growth isn't linear.",
                "Remember: You wrote this when you needed to hear it.",
                "Breathe. This moment will pass, and you will endure.",
                "You've prepared for this {keyword}. Trust yourself.",
                "Anxiety is not a prediction. You are capable.",
                "Past you believed in future you. Honor that faith."
            ],
            .motivation: [
                "You have everything you need to tackle {keyword}.",
                "This {keyword} is your opportunity to grow.",
                "Channel your energy into {keyword} and watch what happens.",
                "Remember why you started this {keyword}.",
                "You're capable of more than you know. Prove it with {keyword}.",
                "Let {keyword} fuel your determination.",
                "The best time to start was yesterday. The next best time is now.",
                "Your future self will thank you for tackling {keyword} today.",
                "You're not just doing {keyword}—you're becoming stronger.",
                "Small steps toward {keyword} lead to big changes."
            ],
            .gratitude: [
                "Hold onto the feeling of {keyword}.",
                "This {keyword} is a gift. Treasure it.",
                "Gratitude for {keyword} amplifies joy.",
                "Remember the warmth of {keyword} when times are tough.",
                "You noticed {keyword}—that's mindfulness in action.",
                "Let {keyword} remind you of what matters.",
                "This {keyword} is proof of abundance in your life.",
                "Appreciation for {keyword} creates more moments like this.",
                "You took time to honor {keyword}. That's beautiful.",
                "The simple act of recognizing {keyword} is powerful."
            ],
            .struggle: [
                "You're facing {keyword} head-on. That takes courage.",
                "This {keyword} is hard, and it's okay to acknowledge that.",
                "Struggling with {keyword} doesn't mean you're failing.",
                "You're learning from {keyword}, even if it doesn't feel like it.",
                "The fact that you're still here despite {keyword} is strength.",
                "This {keyword} is shaping you, not breaking you.",
                "One day, this {keyword} will be a story of resilience.",
                "You don't have to face {keyword} alone.",
                "It's okay to rest during {keyword}. You're still making progress.",
                "This {keyword} is temporary. You are enduring."
            ],
            .joy: [
                "Savor this {keyword}!",
                "This {keyword} is yours to celebrate.",
                "Let the happiness from {keyword} fill you completely.",
                "Remember how {keyword} made you feel alive.",
                "This {keyword} is pure magic.",
                "You created this moment of {keyword}. Well done!",
                "The joy from {keyword} is contagious—share it!",
                "This {keyword} is a reminder that life is beautiful.",
                "Hold onto the lightness of {keyword}.",
                "You deserve every bit of this {keyword}."
            ],
            .reflection: [
                "The insight from {keyword} will serve you well.",
                "You learned something valuable from {keyword}.",
                "This {keyword} helped you understand yourself better.",
                "The wisdom from {keyword} is a gift.",
                "You took time to reflect on {keyword}—that's growth.",
                "This {keyword} taught you something important.",
                "Your reflection on {keyword} shows maturity.",
                "The lessons from {keyword} will guide your future.",
                "You're wiser because of {keyword}.",
                "This {keyword} is part of your evolving story."
            ],
            .hope: [
                "This {keyword} is the beginning of something beautiful.",
                "Your hope for {keyword} is powerful.",
                "Trust the journey toward {keyword}.",
                "This {keyword} is worth believing in.",
                "Your optimism about {keyword} will carry you forward.",
                "The hope you feel for {keyword} is valid and real.",
                "This {keyword} is a seed you're planting for the future.",
                "Believe in the possibility of {keyword}.",
                "Your vision of {keyword} is coming into focus.",
                "This {keyword} represents new beginnings."
            ]
        ]
        self.isLoaded = true
        print("ℹ️ Using sample templates for \(templates.keys.count) emotions")
    }

    // MARK: - Recommendation Generation

    /// Generate a smart recommendation for a Vibe
    /// Based on SRS Section 3.3 - FR-004: Smart Recommendation Generation
    /// - Parameters:
    ///   - vibe: The Vibe to generate recommendation for
    /// - Returns: Generated recommendation string (1-2 sentences, <100 characters)
    func generateRecommendation(for vibe: Vibe) -> String {
        guard isLoaded else {
            loadTemplates()
        }

        // Get templates for this emotion
        guard let emotionTemplates = templates[vibe.emotion], !emotionTemplates.isEmpty else {
            return "Remember this moment."
        }

        // Extract keywords from Vibe text
        // Based on SRS Section 4.3 - Keyword Extraction Logic
        let keywords = extractKeywords(from: vibe.text)

        // Select random template
        guard let template = emotionTemplates.randomElement() else {
            return "Remember this moment."
        }

        // Insert keywords into template placeholders
        if template.contains("{keyword}"), let keyword = keywords.first {
            return template.replacingOccurrences(of: "{keyword}", with: keyword.lowercased())
        } else {
            // Template has no placeholder or no keywords found
            return template
        }
    }

    // MARK: - Keyword Extraction

    /// Extract 1-2 keywords (nouns/verbs) from text using NaturalLanguage framework
    /// Based on SRS Section 4.3 - SR-002: Keyword extraction must run locally
    /// - Parameter text: The text to analyze
    /// - Returns: Array of extracted keywords (top 1-2)
    private func extractKeywords(from text: String) -> [String] {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = text

        var keywords: [String] = []

        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass) { tag, tokenRange in
            if let tag = tag {
                // Extract nouns and verbs only
                if tag == .noun || tag == .verb {
                    let keyword = String(text[tokenRange])
                    // Filter out common words
                    if keyword.count > 3 && !isCommonWord(keyword) {
                        keywords.append(keyword)
                    }
                }
            }
            return true
        }

        // Return top 2 keywords
        return Array(keywords.prefix(2))
    }

    /// Check if word is too common to be useful as keyword
    private func isCommonWord(_ word: String) -> Bool {
        let commonWords = ["this", "that", "have", "been", "were", "their", "there", "about", "would", "could", "should"]
        return commonWords.contains(word.lowercased())
    }
}

// MARK: - JSON Response Structure
private struct TemplateResponse: Codable {
    let templates: [Emotion: [String]]
}
