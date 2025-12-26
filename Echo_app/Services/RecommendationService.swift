//
//  RecommendationService.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation
import NaturalLanguage

/// Template structure for bilingual recommendations
struct Template: Codable {
    let en: String
    let ko: String
}

/// Service responsible for generating template-based smart recommendations
/// Based on SRS Section 4.3 - Template-Based Smart Recommendations
final class RecommendationService {
    static let shared = RecommendationService()

    private var templates: [Emotion: [Template]] = [:]
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
                Template(en: "This moment of {keyword} shows your true capability.", ko: "이 {keyword}의 순간은 당신의 진정한 능력을 보여줍니다."),
                Template(en: "Remember the strength it took to achieve {keyword}.", ko: "{keyword}을(를) 이루는 데 필요했던 힘을 기억하세요.")
            ],
            .comfort: [
                Template(en: "You've survived challenges before. You'll survive this too.", ko: "전에도 어려움을 극복했습니다. 이번에도 극복할 것입니다."),
                Template(en: "Be gentle with yourself during {keyword}.", ko: "{keyword} 동안 자신에게 친절하세요.")
            ],
            .motivation: [
                Template(en: "You have everything you need to tackle {keyword}.", ko: "{keyword}에 맞서기 위해 필요한 모든 것을 가지고 있습니다."),
                Template(en: "This {keyword} is your opportunity to grow.", ko: "이 {keyword}는 당신이 성장할 기회입니다.")
            ],
            .gratitude: [
                Template(en: "Hold onto the feeling of {keyword}.", ko: "{keyword}의 느낌을 간직하세요."),
                Template(en: "This {keyword} is a gift. Treasure it.", ko: "이 {keyword}는 선물입니다. 소중히 여기세요.")
            ],
            .struggle: [
                Template(en: "You're facing {keyword} head-on. That takes courage.", ko: "{keyword}에 정면으로 맞서고 있습니다. 그것은 용기가 필요한 일입니다."),
                Template(en: "This {keyword} is hard, and it's okay to acknowledge that.", ko: "이 {keyword}는 힘듭니다. 그것을 인정해도 괜찮습니다.")
            ],
            .joy: [
                Template(en: "Savor this {keyword}!", ko: "이 {keyword}를 음미하세요!"),
                Template(en: "This {keyword} is yours to celebrate.", ko: "이 {keyword}는 축하할 당신의 것입니다.")
            ],
            .reflection: [
                Template(en: "The insight from {keyword} will serve you well.", ko: "{keyword}에서 얻은 통찰은 당신에게 큰 도움이 될 것입니다."),
                Template(en: "You learned something valuable from {keyword}.", ko: "{keyword}에서 귀중한 것을 배웠습니다.")
            ],
            .hope: [
                Template(en: "This {keyword} is the beginning of something beautiful.", ko: "이 {keyword}는 아름다운 무언가의 시작입니다."),
                Template(en: "Your hope for {keyword} is powerful.", ko: "{keyword}에 대한 당신의 희망은 강력합니다.")
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
    /// - Returns: Generated bilingual recommendation string (English + Korean)
    func generateRecommendation(for vibe: Vibe) -> String {
        guard isLoaded else {
            loadTemplates()
        }

        // Get templates for this emotion
        guard let emotionTemplates = templates[vibe.emotion], !emotionTemplates.isEmpty else {
            return "Remember this moment.\n이 순간을 기억하세요."
        }

        // Extract keywords from Vibe text
        // Based on SRS Section 4.3 - Keyword Extraction Logic
        let keywords = extractKeywords(from: vibe.text)

        // Select random template
        guard let template = emotionTemplates.randomElement() else {
            return "Remember this moment.\n이 순간을 기억하세요."
        }

        // Insert keywords into template placeholders
        let recommendationEn: String
        let recommendationKo: String

        if template.en.contains("{keyword}") || template.ko.contains("{keyword}"), let keyword = keywords.first {
            recommendationEn = template.en.replacingOccurrences(of: "{keyword}", with: keyword.lowercased())
            recommendationKo = template.ko.replacingOccurrences(of: "{keyword}", with: keyword.lowercased())
        } else {
            // Template has no placeholder or no keywords found
            recommendationEn = template.en
            recommendationKo = template.ko
        }

        // Return bilingual format (English + Korean)
        return "\(recommendationEn)\n\(recommendationKo)"
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
    let templates: [Emotion: [Template]]
}
