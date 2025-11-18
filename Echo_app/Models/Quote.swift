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
/// Now supports bilingual content (English/Korean)
struct Quote: Codable, Identifiable {
    let id: String

    // Bilingual text
    let textEn: String
    let textKo: String

    // Bilingual author
    let author: String
    let authorKo: String?

    // Bilingual source
    let source: String
    let sourceKo: String?

    let emotionTags: [Emotion]
    let category: QuoteCategory

    /// Quote category for organizational purposes
    enum QuoteCategory: String, Codable {
        case stoicism = "Stoicism"
        case mindfulness = "Mindfulness"
        case psychology = "Psychology"
        case literature = "Literature"
        case poetry = "Poetry"
        case philosophy = "Philosophy"
        case science = "Science"
        case sports = "Sports"
        case business = "Business"
        case leadership = "Leadership"
        case spirituality = "Spirituality"
        case history = "History"
        case art = "Art"
        case music = "Music"
        case humor = "Humor"
        case modernWisdom = "Modern Wisdom"
        case easternPhilosophy = "Eastern Philosophy"
        case entertainment = "Entertainment"
        case military = "Military"
        case activism = "Activism"

        /// Korean translation of category
        var korean: String {
            switch self {
            case .stoicism: return "스토아철학"
            case .mindfulness: return "마음챙김"
            case .psychology: return "심리학"
            case .literature: return "문학"
            case .poetry: return "시"
            case .philosophy: return "철학"
            case .science: return "과학"
            case .sports: return "스포츠"
            case .business: return "비즈니스"
            case .leadership: return "리더십"
            case .spirituality: return "영성"
            case .history: return "역사"
            case .art: return "예술"
            case .music: return "음악"
            case .humor: return "유머"
            case .modernWisdom: return "현대 지혜"
            case .easternPhilosophy: return "동양철학"
            case .entertainment: return "엔터테인먼트"
            case .military: return "군사"
            case .activism: return "행동주의"
            }
        }
    }

    /// Formatted quote with attribution (English)
    /// Example: "The impediment to action...\n— Marcus Aurelius"
    var formattedTextEn: String {
        return "\"\(textEn)\"\n\n— \(author)"
    }

    /// Formatted quote with attribution (Korean)
    var formattedTextKo: String {
        let authorText = authorKo ?? author
        return "\"\(textKo)\"\n\n— \(authorText)"
    }

    /// Formatted quote with bilingual display (English on top, Korean below)
    var formattedTextBilingual: String {
        return "\"\(textEn)\"\n\"\(textKo)\"\n\n— \(author)"
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
            textEn: "The impediment to action advances action. What stands in the way becomes the way.",
            textKo: "행동의 장애물이 행동을 전진시킨다. 길을 가로막는 것이 바로 길이 된다.",
            author: "Marcus Aurelius",
            authorKo: "마르쿠스 아우렐리우스",
            source: "Meditations",
            sourceKo: "명상록",
            emotionTags: [.struggle, .motivation, .reflection],
            category: .stoicism
        ),
        Quote(
            id: "q002",
            textEn: "You are not your thoughts. You are the observer of your thoughts.",
            textKo: "당신은 당신의 생각이 아닙니다. 당신은 생각을 관찰하는 자입니다.",
            author: "Amit Ray",
            authorKo: "아미트 레이",
            source: "Mindfulness Meditation",
            sourceKo: "마음챙김 명상",
            emotionTags: [.comfort, .reflection],
            category: .mindfulness
        ),
        Quote(
            id: "q003",
            textEn: "What we think, we become.",
            textKo: "우리가 생각하는 것이 곧 우리 자신이 된다.",
            author: "Buddha",
            authorKo: "붓다",
            source: "Buddhist Teachings",
            sourceKo: "불교 가르침",
            emotionTags: [.hope, .motivation, .reflection],
            category: .philosophy
        ),
        Quote(
            id: "q004",
            textEn: "The only way out is through.",
            textKo: "빠져나가는 유일한 길은 통과하는 것이다.",
            author: "Robert Frost",
            authorKo: "로버트 프로스트",
            source: "A Servant to Servants",
            sourceKo: "하인들의 하인",
            emotionTags: [.struggle, .motivation],
            category: .literature
        ),
        Quote(
            id: "q005",
            textEn: "Gratitude turns what we have into enough.",
            textKo: "감사는 우리가 가진 것을 충분하게 만든다.",
            author: "Aesop",
            authorKo: "이솝",
            source: "Fables",
            sourceKo: "우화",
            emotionTags: [.gratitude, .joy],
            category: .philosophy
        ),
        Quote(
            id: "q006",
            textEn: "You have within you right now, everything you need to deal with whatever the world throws at you.",
            textKo: "당신은 지금 이 순간, 세상이 던지는 모든 것을 감당할 수 있는 모든 것을 이미 가지고 있습니다.",
            author: "Brian Tracy",
            authorKo: "브라이언 트레이시",
            source: "Self-Development",
            sourceKo: "자기계발",
            emotionTags: [.comfort, .motivation, .hope],
            category: .psychology
        ),
        Quote(
            id: "q007",
            textEn: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
            textKo: "성공은 최종적인 것이 아니고, 실패는 치명적인 것이 아니다. 중요한 것은 계속할 용기다.",
            author: "Winston Churchill",
            authorKo: "윈스턴 처칠",
            source: "Speech",
            sourceKo: "연설",
            emotionTags: [.achievement, .motivation, .struggle],
            category: .philosophy
        ),
        Quote(
            id: "q008",
            textEn: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
            textKo: "삶의 가장 큰 영광은 넘어지지 않는 데 있는 것이 아니라, 넘어질 때마다 일어서는 데 있다.",
            author: "Nelson Mandela",
            authorKo: "넬슨 만델라",
            source: "Long Walk to Freedom",
            sourceKo: "자유를 향한 긴 여정",
            emotionTags: [.struggle, .hope, .achievement],
            category: .philosophy
        )
    ]
}
