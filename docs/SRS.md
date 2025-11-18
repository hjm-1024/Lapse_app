# Software Requirements Specification (SRS)
## Echo_app - Your Voice from the Past

**Document Version:** 2.0
**Date:** 2025-11-18
**Project:** Echo_app (formerly Lapse_app)
**Standard:** IEEE 830-1998 (Adapted)

---

## Table of Contents

1. **Introduction**
   - 1.1 Purpose
   - 1.2 Document Conventions
   - 1.3 Intended Audience and Reading Suggestions
   - 1.4 Project Scope
   - 1.5 References

2. **Overall Description**
   - 2.1 Product Perspective
   - 2.2 Product Functions
   - 2.3 User Classes and Characteristics
   - 2.4 Operating Environment
   - 2.5 Design and Implementation Constraints
   - 2.6 Assumptions and Dependencies

3. **Specific Requirements**
   - 3.1 External Interface Requirements
   - 3.2 System Features
   - 3.3 Functional Requirements

4. **System Features**
   - 4.1 Vibe Recording with Emotional Context
   - 4.2 Ebbinghaus-Based Scheduling System
   - 4.3 Template-Based Smart Recommendations
   - 4.4 Quote Database and Matching Engine
   - 4.5 Time-Delayed Notification System
   - 4.6 Vibe Revelation and Reflection

5. **Non-Functional Requirements**
   - 5.1 Performance Requirements
   - 5.2 Safety Requirements
   - 5.3 Security Requirements
   - 5.4 Software Quality Attributes
   - 5.5 Business Rules

6. **Other Requirements**
   - 6.1 Appendix A: Glossary
   - 6.2 Appendix B: Ebbinghaus Forgetting Curve Model
   - 6.3 Appendix C: Emotion Classification System
   - 6.4 Appendix D: To Be Determined List

---

## 1. Introduction

### 1.1 Purpose

This Software Requirements Specification (SRS) document provides a comprehensive description of the requirements for **Echo_app**, an iOS application designed to deliver a **scientifically-grounded, privacy-first psychological wellness tool** based on the Ebbinghaus Forgetting Curve.

The document is intended to serve multiple purposes:
- **Investment & Stakeholder Communication:** Demonstrate product-market fit in the mental health & wellness app category with scientific backing
- **Development Guidance:** Define functional and non-functional requirements for the engineering team
- **Quality Assurance:** Establish testable criteria for validation and verification
- **App Store Submission:** Document core features, privacy compliance, and health app guidelines adherence

This SRS adheres to IEEE 830-1998 standard while maintaining focus on the core "Vibe" of the product: **scientifically-informed memory reinforcement, complete privacy, and minimalist design**.

**Key Pivot from v1.0:**
Echo_app evolves from a passive time capsule to an **active memory reinforcement system**. Users now send messages to their future selves at scientifically-optimized intervals (1 day, 3 days, 7 days, 30 days, 90 days) based on Hermann Ebbinghaus's research on memory retention. The app serves as a **personal psychological support system** rather than merely a reflection tool.

### 1.2 Document Conventions

**Priority Levels:**
- **Critical:** Core functionality without which the app cannot fulfill its primary purpose
- **Important:** Features that significantly enhance user experience but are not blocking for MVP
- **Optional:** Nice-to-have features for future iterations

**Typographic Conventions:**
- `Code elements` are displayed in monospace font
- **Bold text** indicates key terms and priorities
- *Italic text* indicates user-facing terminology

**Data Definitions:**
- **Vibe:** A user-generated text entry (max 280 characters) representing a moment, feeling, thought, or self-directed message
- **Echo:** The system mechanism that delivers a Vibe back to the user at a scheduled future time
- **Ebbinghaus Interval:** Scientifically-derived time intervals (1d, 3d, 7d, 30d, 90d) optimized for memory retention
- **Emotional Context:** User-assigned or system-inferred emotional category (achievement, comfort, motivation, struggle, joy, etc.)
- **Smart Recommendation:** Template-based sentence generation using local emotion analysis and keyword matching
- **Quote Match:** Relevant inspirational quote from local database matched to Vibe's emotional context

### 1.3 Intended Audience and Reading Suggestions

| Audience | Recommended Sections | Purpose |
|----------|---------------------|---------|
| **Investors/Stakeholders** | 1.4, 2.1, 5.4, Appendix B | Understand scientific foundation, market positioning, and wellness app category fit |
| **iOS Developers** | 3, 4, 2.5, Appendix C | Implement features according to technical specifications |
| **UI/UX Designers** | 2.1, 2.2, 4, 5.4 | Design interfaces that align with minimalist and wellness-focused principles |
| **QA Engineers** | 3, 4, 5 | Develop test plans and acceptance criteria |
| **Project Managers** | All sections | Track progress and validate deliverables |
| **Mental Health Advisors** | 1.4, 4.3, 4.4, Appendix B | Validate psychological safety and scientific accuracy |

**Reading Suggestions:**
1. Start with Section 1.4 (Project Scope) to understand the product vision and scientific foundation
2. Review Appendix B (Ebbinghaus Forgetting Curve Model) for the theoretical basis
3. Review Section 2 (Overall Description) for product context and market fit
4. Deep-dive into Sections 3-4 for detailed requirements
5. Consult Section 5 for quality benchmarks and privacy compliance

### 1.4 Project Scope

**Product Name:** Echo_app

**Tagline:** "Your Voice from the Past, When You Need It Most"

**Core Concept:**
Echo_app is a **scientifically-grounded iOS wellness application** that helps users reinforce positive memories, prepare for challenging situations, and maintain psychological resilience through time-delayed self-messages.

Based on Hermann Ebbinghaus's **Forgetting Curve** research (1885), the app enables users to:
1. Record a "Vibe" (a message to their future self) with emotional context
2. Select an optimal delivery interval (1 day, 3 days, 7 days, 30 days, or 90 days)
3. Receive local push notifications when the scheduled time arrives
4. Access **Smart Recommendations** (template-based encouragement) and **Matched Quotes** from a curated database

**Scientific Foundation:**
The Ebbinghaus Forgetting Curve demonstrates that memory retention decays exponentially without reinforcement. Echo_app applies this principle by:
- **1-day interval:** Immediate reinforcement for daily affirmations
- **3-day interval:** Short-term motivation and accountability
- **7-day interval:** Weekly reflection and pattern recognition
- **30-day interval:** Monthly goal tracking and milestone celebration
- **90-day interval:** Quarterly perspective and long-term resilience building

**Primary Objectives:**
1. **Leverage Science:** Apply cognitive psychology research to improve mental wellness
2. **Reduce Cognitive Load:** Simple, focused interaction (one Vibe at a time)
3. **Provide Proactive Support:** Deliver encouragement when users need it, not just when they request it
4. **Ensure Privacy:** 100% local data storage with zero cloud dependency or analytics tracking
5. **Deliver Reliability:** Guarantee notification delivery using iOS UserNotifications framework

**Key Differentiators:**
- **Scientific Credibility:** Ebbinghaus-based intervals provide evidence-based value proposition
- **No Server Infrastructure:** Entire app operates offline; no authentication, no backend costs, no data leaks
- **Smart Recommendations:** Template-based system generates contextual encouragement without cloud AI
- **Curated Quote Database:** 1,000-2,000 inspirational quotes locally stored and emotionally categorized
- **Dual-Purpose Design:** Celebrate successes AND prepare for challenges
- **Zero Maintenance:** No user management of archives; automatic scheduling handles everything

**Core User Flows:**

**Flow 1: Recording a Positive Memory**
1. User opens app after achieving something (e.g., "I finished my first marathon!")
2. Selects emotion: "Achievement"
3. Selects interval: 30 days
4. App saves Vibe + schedules notification for 30 days later
5. 30 days later: Notification arrives → User opens → Sees original Vibe + Smart Recommendation: "Remember this strength when facing new challenges" + Matched Quote from database

**Flow 2: Preparing for Future Challenges**
1. User is feeling anxious about upcoming event (e.g., "I'm nervous about the presentation")
2. Writes reassurance to future self: "You've prepared well. Trust yourself."
3. Selects emotion: "Comfort"
4. Selects interval: 3 days (scheduled for morning of presentation)
5. 3 days later: Notification arrives with original message + calming quote

**In Scope (MVP v1.0):**
- ✅ Ebbinghaus interval selection (1d, 3d, 7d, 30d, 90d)
- ✅ Emotional context tagging (6-10 basic emotions)
- ✅ Template-based Smart Recommendations (local processing)
- ✅ Quote database (1,000+ quotes, categorized)
- ✅ Local push notifications
- ✅ SwiftUI interface with minimalist design
- ✅ SwiftData persistence (100% local)
- ✅ Basic analytics dashboard (local only: "You've sent X Echoes this month")

**Out of Scope (Explicitly Excluded from MVP):**
- ❌ Cloud-based AI text generation
- ❌ Multi-user or social features
- ❌ Cloud sync or backup
- ❌ Export/import functionality
- ❌ Rich media (photos, videos, audio)
- ❌ Third-party analytics or tracking
- ❌ Customizable intervals beyond the 5 Ebbinghaus presets

**Future Considerations (v2.0+):**
- 🔮 On-device AI using Core ML (iOS 18+)
- 🔮 Advanced sentiment analysis
- 🔮 Pattern recognition ("You tend to need comfort on Mondays")
- 🔮 Journal view (opt-in archive access)
- 🔮 Widget support for today's scheduled Echoes

**Success Metrics (Post-Launch):**
- **Retention Rate:** 50%+ users still recording Vibes after 90 days (higher than v1.0 due to active support)
- **Notification Engagement:** 70%+ users open notifications when delivered (higher due to relevance)
- **Multi-Interval Usage:** 60%+ users utilize at least 3 different time intervals
- **App Store Rating:** 4.6+ stars with <1.5% crash rate
- **Privacy Compliance:** Zero data breach incidents, full GDPR/CCPA adherence
- **Health Category Recognition:** Featured in "Mental Health" or "Self-Care" App Store category

**Target Market:**
- **Primary:** Adults 25-45 managing stress, building resilience, or pursuing personal growth
- **Secondary:** Students preparing for exams/interviews, professionals in high-pressure careers
- **Tertiary:** Anyone interested in evidence-based self-improvement tools

**Competitive Positioning:**
Echo_app occupies the intersection of **journaling apps** (Day One, Journey), **habit trackers** (Streaks, Habitica), and **mental wellness apps** (Headspace, Calm) but with unique differentiation:
- More structured than journaling (Ebbinghaus intervals)
- More reflective than habit tracking (emotional context)
- More actionable than meditation apps (proactive message delivery)

### 1.5 References

**Scientific Foundation:**
- Ebbinghaus, H. (1885). *Memory: A Contribution to Experimental Psychology*
- Bjork, R. A., & Bjork, E. L. (1992). *A New Theory of Disuse and an Old Theory of Stimulus Fluctuation*
- Cognitive Psychology Research on Spaced Repetition and Memory Retention

**Technical Standards:**
- Apple Human Interface Guidelines (iOS 17+): https://developer.apple.com/design/human-interface-guidelines/
- SwiftUI Framework Documentation: https://developer.apple.com/documentation/swiftui/
- SwiftData Framework Documentation: https://developer.apple.com/documentation/swiftdata/
- UserNotifications Framework: https://developer.apple.com/documentation/usernotifications/
- Core ML (Natural Language Processing): https://developer.apple.com/documentation/coreml/

**Design Philosophy:**
- Nielsen Norman Group - 10 Usability Heuristics: https://www.nngroup.com/articles/ten-usability-heuristics/
- Dieter Rams - 10 Principles of Good Design
- Apple Design Awards - Health & Fitness Category Guidelines

**Compliance & Legal:**
- Apple App Store Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- App Store Health & Fitness Category Guidelines
- GDPR (General Data Protection Regulation)
- CCPA (California Consumer Privacy Act)
- HIPAA Awareness (not a medical device, but psychological safety principles apply)

**Quote Database Sources (Public Domain):**
- Stoic philosophy (Marcus Aurelius, Seneca, Epictetus)
- Modern psychology and self-help literature (with proper attribution)
- Poetry and literature (public domain works)
- Scientific and philosophical figures

**Project Management:**
- IEEE 830-1998: Recommended Practice for Software Requirements Specifications

---

*[End of Section 1: Introduction]*

---

## 2. Overall Description

### 2.1 Product Perspective

**Market Category:** Mental Health & Wellness / Self-Care / Personal Development

Echo_app is a **standalone, self-contained iOS application** with no external system dependencies. It operates entirely offline and does not interface with:
- Cloud services or backend servers
- Third-party APIs (except for optional future features)
- Social networks or multi-user platforms
- Analytics or tracking services

**System Context Diagram:**

```
┌─────────────────────────────────────────┐
│         iOS Device (iPhone)             │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │       Echo_app                    │ │
│  │                                   │ │
│  │  ┌─────────────────────────────┐ │ │
│  │  │  SwiftUI Interface Layer    │ │ │
│  │  └─────────────────────────────┘ │ │
│  │              ↕                   │ │
│  │  ┌─────────────────────────────┐ │ │
│  │  │  Business Logic Layer       │ │ │
│  │  │  - Ebbinghaus Scheduler     │ │ │
│  │  │  - Emotion Analyzer         │ │ │
│  │  │  - Template Generator       │ │ │
│  │  │  - Quote Matcher            │ │ │
│  │  └─────────────────────────────┘ │ │
│  │              ↕                   │ │
│  │  ┌─────────────────────────────┐ │ │
│  │  │  Data Persistence Layer     │ │ │
│  │  │  - SwiftData (User Vibes)   │ │ │
│  │  │  - JSON (Quote DB)          │ │ │
│  │  │  - UserDefaults (Prefs)     │ │ │
│  │  └─────────────────────────────┘ │ │
│  └───────────────────────────────────┘ │
│                  ↕                      │
│  ┌───────────────────────────────────┐ │
│  │  iOS System Services              │ │
│  │  - UserNotifications Framework    │ │
│  │  - Local Storage (File System)    │ │
│  └───────────────────────────────────┘ │
└─────────────────────────────────────────┘
         ↕ (No network required)
    [User interactions only]
```

**Competitive Landscape Analysis:**

| Competitor | Category | Key Feature | Echo_app Advantage |
|------------|----------|-------------|-------------------|
| **Day One** | Journaling | Rich media, cloud sync | Simpler (text-only), no subscription, science-based timing |
| **Headspace** | Meditation | Guided sessions | Proactive (automated delivery), personalized to user's words |
| **Habitica** | Habit Tracking | Gamification | Focus on emotional support, not metrics |
| **1 Second Everyday** | Video Diary | Daily video clips | Lower barrier (text vs. video), privacy-first |
| **Future Me (Email)** | Time Capsule | Email to future self | Native app, local storage, Ebbinghaus intervals |

**Unique Value Proposition:**
Echo_app is the **only iOS app** that combines:
1. **Scientific credibility** (Ebbinghaus research)
2. **Complete privacy** (100% local, no account required)
3. **Proactive support** (automated delivery based on user-selected timing)
4. **Smart augmentation** (template recommendations + quote matching)

### 2.2 Product Functions

**High-Level Feature Summary:**

| Feature | Description | Priority |
|---------|-------------|----------|
| **Vibe Composer** | Text entry interface (280 char limit) with emotion selector and interval picker | Critical |
| **Ebbinghaus Scheduler** | Algorithm that calculates delivery dates based on selected interval (1d, 3d, 7d, 30d, 90d) | Critical |
| **Local Notification Engine** | Schedules and delivers push notifications at calculated times | Critical |
| **Smart Recommendation Generator** | Template-based system that analyzes emotion + keywords and generates supportive sentence | Important |
| **Quote Database & Matcher** | Local database of 1,000-2,000 quotes with emotion tags; matches quotes to Vibe context | Important |
| **Revelation View** | Display interface showing original Vibe + recommendation + matched quote | Critical |
| **Local Analytics Dashboard** | Displays usage stats (total Echoes sent, most-used emotion, etc.) without external tracking | Optional |
| **Onboarding Flow** | First-time user tutorial explaining Ebbinghaus concept and app mechanics | Important |
| **Settings Panel** | Notification preferences, app info, privacy policy | Important |

**User Interaction Model:**

```
[App Launch]
     ↓
[Home Screen: "Send an Echo" button]
     ↓
[Vibe Composer]
 - Text entry field
 - Emotion selector (Achievement, Comfort, Motivation, etc.)
 - Interval picker (1d, 3d, 7d, 30d, 90d)
 - Preview: "This Echo will arrive on [Date]"
     ↓
[Confirm & Send]
     ↓
[Confirmation: "Echo scheduled. See you in X days."]
     ↓
[Return to Home]

---[Time Passes]---

[Local Push Notification Arrives]
     ↓
[User Taps Notification]
     ↓
[Revelation View]
 - Header: "An Echo from [Date]"
 - Original Vibe text
 - Smart Recommendation
 - Matched Quote
 - Action: "Reflect" or "Dismiss"
```

### 2.3 User Classes and Characteristics

**Primary User Personas:**

**Persona 1: "The Resilience Builder" (35% of users)**
- **Demographics:** 28-40 years old, working professional
- **Goals:** Manage work stress, maintain positive mindset during challenging projects
- **Behavior:** Records reassuring messages before big meetings/deadlines; uses 3-day and 7-day intervals most
- **Needs:** Quick entry, reliable delivery, calming quotes
- **Technical Proficiency:** Medium (comfortable with iOS apps)

**Persona 2: "The Achievement Tracker" (25% of users)**
- **Demographics:** 22-35 years old, students or early-career professionals
- **Goals:** Celebrate wins, track personal growth over time
- **Behavior:** Records accomplishments and goals; uses 30-day and 90-day intervals to measure progress
- **Needs:** Motivational content, pattern recognition ("I've grown so much")
- **Technical Proficiency:** High (early adopter of wellness apps)

**Persona 3: "The Mindful Practitioner" (20% of users)**
- **Demographics:** 30-50 years old, interested in self-improvement
- **Goals:** Practice gratitude, maintain daily reflection habit
- **Behavior:** Records daily affirmations; primarily uses 1-day interval
- **Needs:** Simplicity, minimal UI, philosophical quotes
- **Technical Proficiency:** Medium

**Persona 4: "The Anxious Preparer" (20% of users)**
- **Demographics:** 18-30 years old, students or individuals facing transitions
- **Goals:** Manage anxiety about future events (exams, interviews, medical appointments)
- **Behavior:** Writes self-soothing messages timed to arrive before stressful events
- **Needs:** Comfort-focused content, precise timing, gentle reminders
- **Technical Proficiency:** Medium to High

**Secondary Users:**
- **Therapists/Coaches:** May recommend app to clients as homework tool (not direct user, but influencer)
- **Wellness Bloggers:** May review or promote app (not direct user, but amplifier)

**User Expertise Levels:**
- **Novice (30%):** First wellness app user; needs clear onboarding
- **Intermediate (50%):** Familiar with journaling or habit apps
- **Expert (20%):** Power users of multiple self-improvement tools

### 2.4 Operating Environment

**Hardware Requirements:**
- **Device:** iPhone 8 or newer (A11 Bionic chip or later)
- **Screen Size:** Optimized for 4.7" to 6.7" displays
- **Storage:** Minimum 50 MB free space (100 MB recommended for full quote database)
- **RAM:** No specific requirement (iOS manages automatically)

**Software Requirements:**
- **Operating System:** iOS 17.0 or later
- **Frameworks:**
  - SwiftUI (minimum version: iOS 17.0)
  - SwiftData (minimum version: iOS 17.0)
  - UserNotifications (iOS 10.0+, but using iOS 17 features)
  - Foundation (standard library)
- **Optional (Future):** Core ML for iOS 18+ on-device AI features

**Network Requirements:**
- **Primary Operation:** No network connection required
- **App Store Download:** Network required for initial installation and updates only
- **Future Considerations:** Optional network for quote database updates (user consent required)

**Localization:**
- **MVP (v1.0):** English only
- **Future (v1.1+):** Korean, Japanese, Spanish, French

**Accessibility:**
- Full VoiceOver support for visually impaired users
- Dynamic Type support (text scaling)
- High Contrast mode compatibility
- Haptic feedback for critical actions

**Apple Ecosystem Integration:**
- **Notifications:** Standard iOS notification center
- **Widgets (Future):** Home Screen widget showing today's scheduled Echoes
- **Shortcuts (Future):** Siri Shortcuts for quick Vibe recording
- **iCloud (Explicitly NOT supported in MVP):** To maintain 100% local privacy

### 2.5 Design and Implementation Constraints

**Technical Constraints:**

| Constraint Category | Limitation | Rationale |
|---------------------|------------|-----------|
| **Platform** | iOS only (no Android, web, or macOS) | SwiftUI/SwiftData are iOS-native; maintains minimalist scope |
| **Data Storage** | 100% local (no cloud backend) | Privacy-first principle; zero server costs |
| **Network Dependency** | Must function offline | Core value proposition; no reliance on external services |
| **Text Length** | 280 characters max per Vibe | Reduce cognitive load; enforce minimalism |
| **Notification Limit** | iOS allows 64 pending local notifications | App must manage notification slots if user schedules 65+ Echoes |
| **Quote Database Size** | ~2,000 quotes max (~2 MB) | Balance quality vs. app size |
| **AI Processing** | No cloud AI; local templates only (MVP) | Privacy compliance; cost constraints |

**Business Constraints:**
- **Budget:** Solo developer / bootstrapped startup (no VC funding assumed for MVP)
- **Timeline:** MVP must launch within 6 months
- **Legal:** Must comply with App Store Review Guidelines 1.4.1 (no medical claims)
- **Marketing:** App must be self-explanatory (limited marketing budget)

**Regulatory Constraints:**
- **Privacy:** GDPR/CCPA compliance (even though no data is collected, privacy policy still required)
- **Health Claims:** Cannot claim to treat mental illness (disclaimer required)
- **Accessibility:** WCAG 2.1 AA compliance recommended for App Store feature eligibility

**Design Constraints:**
- **Nielsen Heuristics:** Must adhere to #6 (Recognition over recall) and #8 (Aesthetic and minimalist design)
- **Apple HIG:** Must follow iOS design patterns (no custom navigation paradigms)
- **Minimalism:** No more than 3 primary screens (Home, Composer, Revelation)

**Technical Decisions (Locked for MVP):**
- **Architecture:** MVVM (Model-View-ViewModel) pattern with SwiftUI
- **Database:** SwiftData (not Core Data) for modern Swift concurrency
- **Testing:** XCTest framework for unit tests; XCUITest for UI tests
- **Version Control:** Git with GitHub repository

### 2.6 Assumptions and Dependencies

**Assumptions:**

1. **User Behavior Assumptions:**
   - Users will enable push notifications (critical for app value)
   - Users will keep app installed for 90+ days to experience full Ebbinghaus cycle
   - Users understand the concept of "delayed gratification"
   - Users prefer privacy over cloud backup convenience

2. **Technical Assumptions:**
   - iOS UserNotifications framework will continue to support local notifications in future iOS versions
   - SwiftData will remain stable and performant (as of iOS 17)
   - Users will not delete app data (iCloud backup handles device transfers)
   - Device storage is sufficient for 1,000+ Vibes (~500 KB)

3. **Market Assumptions:**
   - Wellness app market will continue growing (2024-2026)
   - Users are willing to pay $2.99-4.99 for privacy-first wellness tools (future monetization)
   - Ebbinghaus research credibility will resonate with target demographic

4. **Legal Assumptions:**
   - App Store policies regarding mental health apps will remain stable
   - No new regulations will require cloud logging or data retention

**Dependencies:**

| Dependency | Type | Risk Level | Mitigation Strategy |
|------------|------|------------|---------------------|
| **iOS 17+ Adoption** | Platform | Medium | Maintain iOS 16 compatibility as fallback (but use #available checks) |
| **SwiftData Stability** | Framework | Medium | Monitor beta releases; have Core Data migration plan |
| **Quote Database Licensing** | Legal | Low | Use only public domain quotes; maintain attribution list |
| **Notification Permissions** | User Action | High | Educate users on why notifications are essential; prompt during onboarding |
| **App Store Approval** | Business | Medium | Follow guidelines strictly; prepare appeal documentation |
| **Developer Account** | Business | Low | Maintain active Apple Developer Program membership ($99/year) |

**External Dependencies (None by Design):**
- No third-party SDKs or frameworks
- No external APIs or web services
- No advertising networks
- No analytics platforms (e.g., Firebase, Amplitude)

**Internal Dependencies:**
- Quote database must be curated before app launch (1,000 minimum)
- Template recommendation rules must be authored (50+ templates for 6-10 emotions)
- Privacy policy and terms of service documents must be written
- App Store metadata (description, screenshots, keywords) must be prepared

**Risks and Contingencies:**
- **Risk:** iOS 18 breaks SwiftData compatibility
  - **Contingency:** Fall back to Core Data implementation
- **Risk:** Users don't enable notifications
  - **Contingency:** In-app banner explaining value loss without notifications
- **Risk:** 64-notification limit reached
  - **Contingency:** Implement notification queue management (cancel oldest, schedule newest)

---

*[End of Section 2: Overall Description]*

---

## 3. Specific Requirements

### 3.1 External Interface Requirements

#### 3.1.1 User Interface Requirements

**UI-001: Home Screen**
- **Description:** Primary landing screen after app launch
- **Components:**
  - Large "Send an Echo" button (primary CTA)
  - Upcoming Echoes counter (e.g., "3 Echoes scheduled")
  - Optional: Mini calendar showing scheduled delivery dates
- **Design:** Minimalist with ample whitespace, single primary action
- **Accessibility:** VoiceOver label: "Send an Echo button, creates new message"

**UI-002: Vibe Composer Screen**
- **Description:** Text entry interface for creating Vibes
- **Components:**
  - Multi-line text field (280 character limit with live counter)
  - Emotion selector (horizontal scroll picker with 6-10 options)
  - Interval picker (segmented control: 1d, 3d, 7d, 30d, 90d)
  - Delivery date preview (e.g., "Arrives on January 15, 2026")
  - "Send Echo" confirmation button
- **Validation:** Character count, emotion selection required, interval selection required
- **Design:** Focus on text input; keyboard appears immediately
- **Accessibility:** Dynamic Type support, high-contrast emotion icons

**UI-003: Revelation Screen**
- **Description:** Display screen when user opens a delivered Echo notification
- **Components:**
  - Header: "An Echo from [original date]"
  - Original Vibe text (displayed prominently)
  - Smart Recommendation (secondary font style)
  - Matched Quote (italic, with attribution)
  - "Reflect" button (optional action) / "Dismiss" button
- **Design:** Card-based layout with clear visual hierarchy
- **Accessibility:** VoiceOver reads in logical order: header → Vibe → recommendation → quote

**UI-004: Settings Screen**
- **Description:** App configuration and information
- **Components:**
  - Notification preferences toggle
  - "About Echo" section (app version, Ebbinghaus explainer)
  - Privacy policy link
  - "Manage Scheduled Echoes" (view/cancel scheduled notifications)
- **Design:** Standard iOS Settings list style
- **Accessibility:** Standard iOS accessibility support

#### 3.1.2 Hardware Interfaces

**HW-001: Device Storage**
- **Description:** Local file system access for data persistence
- **Requirements:**
  - Read/write permissions for app's sandboxed directory
  - Minimum 50 MB available space
  - SwiftData persistent store location: App Documents directory

**HW-002: Notification System**
- **Description:** iOS UserNotifications framework
- **Requirements:**
  - Request notification permissions on first launch
  - Schedule local notifications (no push server)
  - Handle notification tap actions (open Revelation Screen)
  - Support for scheduled delivery at specific times

**HW-003: Display**
- **Description:** iPhone screen
- **Requirements:**
  - Support for 4.7" to 6.7" screen sizes
  - Dynamic Type scaling (accessibility)
  - Dark Mode support

#### 3.1.3 Software Interfaces

**SW-001: SwiftData Framework**
- **Description:** Persistent data storage for user Vibes
- **Interface Methods:**
  - `@Model` classes for Vibe entities
  - `ModelContext` for CRUD operations
  - Query using `@Query` property wrapper
- **Data Stored:**
  - Vibe text (String, max 280 chars)
  - Emotion tag (Enum: Achievement, Comfort, Motivation, etc.)
  - Creation date (Date)
  - Delivery date (Date, calculated from interval)
  - Delivery status (Bool: pending/delivered)

**SW-002: UserNotifications Framework**
- **Description:** Local push notification scheduling
- **Interface Methods:**
  - `UNUserNotificationCenter.requestAuthorization()`
  - `UNMutableNotificationContent()` for content
  - `UNCalendarNotificationTrigger(dateMatching:repeats:)` for scheduling
  - `UNNotificationResponse` for handling taps
- **Payload:**
  - Title: "An Echo has arrived"
  - Body: First 50 characters of original Vibe
  - Custom data: Vibe ID for retrieval

**SW-003: Foundation Framework**
- **Description:** Standard Swift library
- **Interface Methods:**
  - `Date` and `Calendar` for date calculations
  - `String` manipulation for character counting
  - `JSONDecoder` for loading quote database

#### 3.1.4 Communication Interfaces

**COM-001: No External Communication (by Design)**
- **Description:** App operates entirely offline
- **Rationale:** Privacy-first principle; no data transmitted to external servers
- **Exception:** App Store API for download/updates only (handled by iOS, not app code)

### 3.2 System Features

(See Section 4 for detailed System Features breakdown)

### 3.3 Functional Requirements

#### FR-001: Vibe Creation
- **Priority:** Critical
- **Description:** User must be able to create a Vibe with emotion and interval
- **Preconditions:** App installed, notification permissions granted (optional but recommended)
- **Inputs:**
  - Text (1-280 characters, required)
  - Emotion tag (required, one of: Achievement, Comfort, Motivation, Gratitude, Struggle, Joy, Reflection, Hope)
  - Interval (required, one of: 1d, 3d, 7d, 30d, 90d)
- **Processing:**
  1. Validate text length (1-280)
  2. Validate emotion selection
  3. Calculate delivery date: `currentDate + interval`
  4. Generate unique Vibe ID
  5. Save to SwiftData
  6. Schedule local notification for delivery date
- **Outputs:**
  - Confirmation message: "Echo scheduled for [date]"
  - Return to Home Screen
- **Post-conditions:** Vibe stored in database, notification scheduled

#### FR-002: Notification Scheduling
- **Priority:** Critical
- **Description:** System schedules local push notification for calculated delivery date
- **Preconditions:** Vibe created, notification permissions granted
- **Inputs:** Vibe ID, delivery date
- **Processing:**
  1. Check notification permission status
  2. If granted: Create UNNotificationRequest with trigger date
  3. Add request to UNUserNotificationCenter
  4. Handle 64-notification iOS limit (if exceeded, cancel oldest pending notification)
- **Outputs:** Notification scheduled in iOS system
- **Post-conditions:** Notification will fire at specified date/time

#### FR-003: Notification Delivery
- **Priority:** Critical
- **Description:** iOS delivers notification at scheduled time; user taps to open
- **Preconditions:** Delivery date/time reached, app not deleted
- **Inputs:** User tap on notification
- **Processing:**
  1. iOS fires notification
  2. User taps notification
  3. App launches (if not running) or comes to foreground
  4. Retrieve Vibe by ID from notification payload
  5. Generate Smart Recommendation based on Vibe emotion + keywords
  6. Match Quote from database based on emotion tag
  7. Display Revelation Screen
- **Outputs:** Revelation Screen with Vibe + recommendation + quote
- **Post-conditions:** Vibe marked as "delivered" in database

#### FR-004: Smart Recommendation Generation
- **Priority:** Important
- **Description:** Generate contextual encouragement using template-based system
- **Preconditions:** Vibe delivered, emotion tag exists
- **Inputs:**
  - Original Vibe text
  - Emotion tag
  - Keyword extraction (nouns/verbs from Vibe)
- **Processing:**
  1. Load template bank for emotion (e.g., Achievement → 10 templates)
  2. Extract 1-2 keywords from Vibe (basic NLP: most frequent nouns)
  3. Select random template
  4. Insert keywords into template placeholders
  5. Example:
     - Template: "Remember the {keyword} that brought you here."
     - Vibe: "I ran my first marathon today!"
     - Keywords: ["marathon"]
     - Output: "Remember the marathon that brought you here."
- **Outputs:** Generated sentence (1-2 sentences, <100 characters)
- **Post-conditions:** Recommendation displayed on Revelation Screen

#### FR-005: Quote Matching
- **Priority:** Important
- **Description:** Retrieve relevant quote from local database based on emotion
- **Preconditions:** Quote database loaded (JSON file in app bundle)
- **Inputs:** Emotion tag
- **Processing:**
  1. Filter quote database by emotion tag
  2. Select random quote from filtered list
  3. Format quote with attribution (e.g., "— Marcus Aurelius")
- **Outputs:** Quote text + author
- **Post-conditions:** Quote displayed on Revelation Screen

#### FR-006: Scheduled Echoes Management
- **Priority:** Important
- **Description:** User can view and cancel scheduled Echoes
- **Preconditions:** At least one Vibe scheduled
- **Inputs:** User navigates to Settings → "Manage Scheduled Echoes"
- **Processing:**
  1. Query SwiftData for all Vibes where `deliveryStatus == pending`
  2. Display list: [Vibe preview (first 30 chars)] - [Delivery date]
  3. User swipe-to-delete or tap to cancel
  4. Remove from database + cancel notification
- **Outputs:** Updated list of scheduled Echoes
- **Post-conditions:** Cancelled Vibe removed, notification cancelled

#### FR-007: Local Analytics Dashboard
- **Priority:** Optional
- **Description:** Display usage statistics (local only, no tracking)
- **Preconditions:** User has created at least 1 Vibe
- **Inputs:** None (reads from SwiftData)
- **Processing:**
  1. Count total Vibes created
  2. Count Vibes delivered
  3. Identify most-used emotion tag
  4. Calculate retention (days since first Vibe)
- **Outputs:**
  - "You've sent X Echoes"
  - "Most common emotion: [Emotion]"
  - "Using Echo for X days"
- **Post-conditions:** None (read-only display)

---

## 4. System Features

### 4.1 Vibe Recording with Emotional Context

**Description:** Core feature enabling users to create time-delayed messages to their future selves.

**Stimulus/Response Sequences:**
1. **User Action:** Taps "Send an Echo" button on Home Screen
2. **System Response:** Navigates to Vibe Composer Screen, activates keyboard
3. **User Action:** Types text (up to 280 characters)
4. **System Response:** Displays live character counter (e.g., "245/280")
5. **User Action:** Selects emotion from horizontal picker
6. **System Response:** Highlights selected emotion with visual feedback
7. **User Action:** Selects interval (e.g., "7d")
8. **System Response:** Updates delivery date preview: "Arrives on November 25, 2025"
9. **User Action:** Taps "Send Echo" button
10. **System Response:** Saves Vibe, schedules notification, shows confirmation toast

**Functional Requirements:**
- **VR-001:** Text field must enforce 280-character limit (hard limit, cannot exceed)
- **VR-002:** Character counter must update in real-time as user types
- **VR-003:** Emotion selection is mandatory (user cannot proceed without selecting)
- **VR-004:** Interval selection is mandatory
- **VR-005:** Delivery date preview must account for current date + interval accurately
- **VR-006:** "Send Echo" button disabled until all fields valid

**Emotion Categories (Initial Set):**
1. **Achievement** - Celebrating wins, accomplishments, milestones
2. **Comfort** - Self-soothing for anxiety, stress, difficult times
3. **Motivation** - Encouragement for upcoming challenges, goals
4. **Gratitude** - Appreciation, thankfulness, positive moments
5. **Struggle** - Acknowledging hardship, processing difficulty
6. **Joy** - Pure happiness, excitement, positive energy
7. **Reflection** - Thoughtful introspection, learning moments
8. **Hope** - Optimism for future, aspirational thoughts

*(Note: Categories may be refined during UX testing phase)*

### 4.2 Ebbinghaus-Based Scheduling System

**Description:** Scientifically-grounded algorithm that calculates optimal delivery dates based on Hermann Ebbinghaus's Forgetting Curve research.

**Stimulus/Response Sequences:**
1. **User Action:** Selects interval (e.g., "30d")
2. **System Processing:**
   - Current date: November 18, 2025, 14:30
   - Interval: 30 days
   - Calculation: November 18 + 30 days = December 18, 2025
   - Delivery time: 09:00 (morning delivery for better engagement)
3. **System Response:** Displays "Arrives on December 18, 2025 at 9:00 AM"
4. **Background Processing:** Schedules UNNotificationRequest for exact date/time

**Ebbinghaus Interval Justifications:**

| Interval | Scientific Rationale | Use Case |
|----------|---------------------|----------|
| **1 day** | Immediate reinforcement during memory consolidation phase | Daily affirmations, next-day reminders |
| **3 days** | Short-term memory retention peak | Pre-event preparation (e.g., "presentation in 3 days") |
| **7 days** | Weekly rhythm, before significant decay begins | Weekly goals, habit tracking |
| **30 days** | Monthly milestone, long-term memory reinforcement | Monthly reviews, seasonal goals |
| **90 days** | Quarterly perspective, spaced repetition for retention | Major life reflections, long-term resilience |

**Functional Requirements:**
- **ES-001:** Delivery time must default to 09:00 (user's local timezone)
- **ES-002:** System must handle timezone changes (e.g., user travels)
- **ES-003:** If delivery date falls on a date when app is deleted, notification lost (acceptable risk; document in onboarding)
- **ES-004:** System must validate that delivery date is in future (prevent past dates)

**Algorithm Pseudocode:**
```swift
func calculateDeliveryDate(interval: EbbinghausInterval) -> Date {
    let currentDate = Date()
    let calendar = Calendar.current

    let daysToAdd: Int
    switch interval {
    case .oneDay: daysToAdd = 1
    case .threeDays: daysToAdd = 3
    case .sevenDays: daysToAdd = 7
    case .thirtyDays: daysToAdd = 30
    case .ninetyDays: daysToAdd = 90
    }

    let deliveryDate = calendar.date(byAdding: .day, value: daysToAdd, to: currentDate)!
    let deliveryAt9AM = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: deliveryDate)!

    return deliveryAt9AM
}
```

### 4.3 Template-Based Smart Recommendations

**Description:** Local processing system that generates contextual encouragement without cloud AI.

**Stimulus/Response Sequences:**
1. **Trigger:** Notification delivered, user opens Revelation Screen
2. **System Processing:**
   - Retrieve Vibe from database
   - Extract emotion tag (e.g., "Achievement")
   - Perform basic keyword extraction (most common nouns/verbs)
   - Load template bank for "Achievement" emotion (10 templates)
   - Select random template
   - Insert keywords into placeholders
3. **System Response:** Display generated recommendation below original Vibe

**Template Structure Example:**

**Emotion: Achievement**
```
Template 1: "This moment of {keyword} shows your true capability."
Template 2: "Remember the strength it took to achieve {keyword}."
Template 3: "Let this {keyword} remind you what you're capable of."
Template 4: "You've proven yourself with {keyword}. Trust that strength."
Template 5: "This accomplishment isn't luck—it's the result of your effort."
Template 6: "Carry the confidence from this {keyword} forward."
Template 7: "You did it once. You can do it again."
Template 8: "This {keyword} is evidence of your growth."
Template 9: "Celebrate this win. You've earned it."
Template 10: "Your past self would be proud of this {keyword}."
```

**Emotion: Comfort**
```
Template 1: "You've survived challenges before. You'll survive this too."
Template 2: "Be gentle with yourself during {keyword}."
Template 3: "This difficult {keyword} is temporary. You are resilient."
Template 4: "Trust the process. You're stronger than you think."
Template 5: "It's okay to struggle. Growth isn't linear."
Template 6: "Remember: You wrote this when you needed to hear it."
Template 7: "Breathe. This moment will pass, and you will endure."
Template 8: "You've prepared for this {keyword}. Trust yourself."
Template 9: "Anxiety is not a prediction. You are capable."
Template 10: "Past you believed in future you. Honor that faith."
```

*(Note: All 8 emotion categories require 10 templates each = 80 total templates)*

**Keyword Extraction Logic:**
- Use `NSLinguisticTagger` (Foundation framework) to identify parts of speech
- Extract top 1-2 nouns or verbs from Vibe text
- If no keywords found, use generic template without placeholders

**Functional Requirements:**
- **SR-001:** Template bank must be stored in JSON file in app bundle
- **SR-002:** Keyword extraction must run locally (no network calls)
- **SR-003:** If keyword extraction fails, fallback to generic template
- **SR-004:** Randomization must use `SystemRandomNumberGenerator` for true randomness
- **SR-005:** Generated recommendation must be 1-2 sentences, <100 characters

### 4.4 Quote Database and Matching Engine

**Description:** Curated database of 1,000-2,000 inspirational quotes, locally stored and emotionally categorized.

**Stimulus/Response Sequences:**
1. **System Initialization:** App first launch loads `quotes.json` from bundle
2. **Quote Matching:** When Revelation Screen opens:
   - Retrieve Vibe's emotion tag
   - Filter quote database: `quotes.filter { $0.emotionTags.contains(vibeEmotion) }`
   - Select random quote from filtered results
   - Format: Quote text + "— Author Name"
3. **Display:** Show quote in italic font on Revelation Screen

**Quote Database Schema:**
```json
{
  "quotes": [
    {
      "id": "q001",
      "text": "The impediment to action advances action. What stands in the way becomes the way.",
      "author": "Marcus Aurelius",
      "source": "Meditations",
      "emotionTags": ["Struggle", "Motivation", "Reflection"],
      "category": "Stoicism"
    },
    {
      "id": "q002",
      "text": "You are not your thoughts. You are the observer of your thoughts.",
      "author": "Amit Ray",
      "source": "Mindfulness Meditation",
      "emotionTags": ["Comfort", "Reflection"],
      "category": "Mindfulness"
    }
  ]
}
```

**Quote Curation Guidelines:**
- **Public Domain:** Only quotes from public domain sources or with verified attribution
- **Emotional Relevance:** Each quote tagged with 1-3 emotion categories
- **Cultural Sensitivity:** Avoid quotes with religious/political bias
- **Length:** 50-200 characters (readable on mobile)
- **Categories:** Stoicism, Mindfulness, Psychology, Literature, Philosophy, Science

**Quote Sources (Examples):**
- Stoic philosophers: Marcus Aurelius, Seneca, Epictetus
- Psychologists: Carl Jung, Viktor Frankl, Carl Rogers
- Literature: Rumi, Mary Oliver, James Baldwin
- Modern thinkers: Brené Brown, Alan Watts, Pema Chödrön

**Functional Requirements:**
- **QM-001:** Quote database must load synchronously on app launch (blocking, but <100ms)
- **QM-002:** If no quotes match emotion tag, fallback to "Reflection" category (generic)
- **QM-003:** Quote text must be sanitized (remove HTML, special characters)
- **QM-004:** Author attribution mandatory (no anonymous quotes)
- **QM-005:** Database file size must not exceed 2 MB

**Future Enhancement (v2.0):**
- Allow users to "favorite" quotes
- Quote of the day widget
- User-submitted quotes (with moderation)

### 4.5 Time-Delayed Notification System

**Description:** iOS UserNotifications framework integration for reliable local push delivery.

**Stimulus/Response Sequences:**
1. **Permission Request (First Launch):**
   - App requests notification authorization
   - iOS shows system dialog: "Echo would like to send you notifications"
   - User grants or denies
2. **Notification Scheduling (After Vibe Creation):**
   - System creates `UNMutableNotificationContent`
   - Sets title: "An Echo has arrived"
   - Sets body: First 50 characters of Vibe + "..."
   - Creates `UNCalendarNotificationTrigger` with delivery date
   - Adds to `UNUserNotificationCenter`
3. **Notification Delivery (At Scheduled Time):**
   - iOS fires notification at exact date/time
   - Notification appears in Notification Center
   - User taps notification
   - App launches, opens Revelation Screen with Vibe ID from userInfo

**Notification Payload Structure:**
```swift
{
  "title": "An Echo has arrived",
  "body": "I finished my first marathon today!...",
  "userInfo": {
    "vibeID": "UUID-12345",
    "deliveryDate": "2025-12-18T09:00:00Z"
  },
  "sound": "default",
  "badge": 1
}
```

**Functional Requirements:**
- **NS-001:** Notification must fire at exact scheduled time (±1 minute tolerance)
- **NS-002:** Notification sound: Default iOS notification sound
- **NS-003:** Badge: Increment badge count for each delivered Echo
- **NS-004:** Notification must persist in Notification Center until user dismisses
- **NS-005:** Tapping notification must open Revelation Screen directly (deep link)

**iOS Notification Limit Handling (64 Pending Notifications):**
- **Problem:** iOS allows max 64 pending local notifications
- **Solution:** Implement notification queue management:
  ```
  1. When scheduling Vibe #65, detect limit exceeded
  2. Cancel oldest scheduled notification (earliest delivery date)
  3. Schedule new notification
  4. Log warning in Settings: "You have 64 Echoes scheduled. Older Echoes may be cancelled."
  ```
- **User Communication:** Display badge in Settings if >60 Echoes scheduled

**Notification Permission Denial Handling:**
- **If user denies:** Show in-app message explaining value loss
- **Workaround:** User can still manually check "Upcoming Echoes" in app
- **Re-prompt:** After 7 days, show educational modal asking to reconsider

### 4.6 Vibe Revelation and Reflection

**Description:** The moment of "gift-opening" when a scheduled Echo arrives and user experiences their past message.

**Stimulus/Response Sequences:**
1. **Entry Point:** User taps notification OR opens app and sees "New Echo Available" banner
2. **Revelation Screen Display:**
   - Animate slide-in from bottom
   - Header: "An Echo from November 18, 2025" (original creation date)
   - Divider line
   - Original Vibe text (large, primary font)
   - Divider line
   - Smart Recommendation (secondary font, subtle color)
   - Divider line
   - Matched Quote (italic, with attribution)
   - Action buttons: "Reflect" | "Dismiss"
3. **User Actions:**
   - **Reflect:** Opens optional journal view (future feature) or simply dismisses
   - **Dismiss:** Marks Echo as "viewed," returns to Home
4. **Post-Revelation:**
   - Vibe status updated to "delivered"
   - Notification badge cleared
   - Confetti animation (optional, for "Achievement" Echoes)

**UX Considerations:**
- **Emotional Tone:** Gentle, supportive (no aggressive CTAs)
- **Timing:** Allow user to linger (no auto-dismiss)
- **Privacy:** No screenshots prompt (user can screenshot if desired)
- **Re-readability:** User can access delivered Echoes in Settings → "Echo History" (optional v1.1 feature)

**Functional Requirements:**
- **VRV-001:** Revelation Screen must load within 500ms of notification tap
- **VRV-002:** If Vibe data missing (corrupted), show error: "Echo could not be loaded"
- **VRV-003:** Screen must support Dynamic Type (large text accessibility)
- **VRV-004:** "Reflect" action optional (dismissing is sufficient)
- **VRV-005:** Revelation Screen dismisses with swipe-down gesture

**Metrics to Track (Local Only, No External Tracking):**
- Time spent on Revelation Screen (average: 30-60 seconds expected)
- Dismiss vs. Reflect action ratio
- Re-open rate (do users revisit delivered Echoes?)

---

## 5. Non-Functional Requirements

### 5.1 Performance Requirements

**PERF-001: App Launch Time**
- **Requirement:** Cold launch <2 seconds on iPhone 12 or newer
- **Measurement:** Time from app icon tap to Home Screen fully rendered
- **Rationale:** Nielsen's usability guideline (1-second response for instant feel)

**PERF-002: Vibe Save Operation**
- **Requirement:** Save Vibe to SwiftData <500ms
- **Measurement:** Time from "Send Echo" tap to confirmation toast
- **Rationale:** Immediate feedback loop for user confidence

**PERF-003: Notification Scheduling**
- **Requirement:** Schedule notification <200ms
- **Measurement:** Time from SwiftData save to UNNotificationRequest added
- **Rationale:** Background operation, user shouldn't notice delay

**PERF-004: Quote Database Load**
- **Requirement:** Load `quotes.json` <100ms on app launch
- **Measurement:** Time to parse JSON and cache in memory
- **Rationale:** Synchronous load acceptable if fast; prevents async complexity

**PERF-005: Keyword Extraction**
- **Requirement:** Extract keywords from Vibe text <50ms
- **Measurement:** Time for NSLinguisticTagger processing
- **Rationale:** Must not delay Revelation Screen load

**PERF-006: Battery Impact**
- **Requirement:** App must not consume >2% battery per day when idle
- **Measurement:** Xcode Instruments battery profiling
- **Rationale:** Background operation should be negligible

**PERF-007: Memory Footprint**
- **Requirement:** App memory usage <100 MB during active use
- **Measurement:** Xcode Memory Graph Debugger
- **Rationale:** Minimize resource consumption on older devices

### 5.2 Safety Requirements

**SAFE-001: Data Loss Prevention**
- **Requirement:** Vibes must persist across app crashes or force-quits
- **Implementation:** SwiftData auto-saves; no manual save required
- **Testing:** Kill app during Vibe creation, verify data recovery

**SAFE-002: Notification Persistence**
- **Requirement:** Scheduled notifications must survive device reboot
- **Implementation:** iOS handles persistence; verify on iOS 17+
- **Testing:** Reboot device with scheduled notifications, verify delivery

**SAFE-003: Graceful Degradation**
- **Requirement:** If quote database fails to load, app must still function
- **Implementation:** Fallback to empty quote (show only Vibe + recommendation)
- **Testing:** Corrupt `quotes.json`, verify app doesn't crash

**SAFE-004: Timezone Handling**
- **Requirement:** Delivery dates must adjust if user changes timezone
- **Implementation:** Use `Calendar.current` (respects device timezone)
- **Testing:** Create Vibe in PST, change device to EST, verify delivery time

**SAFE-005: Character Encoding**
- **Requirement:** Support Unicode (emoji, non-Latin scripts)
- **Implementation:** Swift String natively supports Unicode
- **Testing:** Enter emoji and Korean text, verify display

### 5.3 Security Requirements

**SEC-001: Local Data Encryption**
- **Requirement:** All Vibes stored with iOS Data Protection (FileProtectionType.complete)
- **Implementation:** SwiftData uses iOS encryption by default
- **Verification:** Check iOS keychain protection level

**SEC-002: No Data Transmission**
- **Requirement:** Zero network requests (except App Store)
- **Implementation:** No URLSession calls in app code
- **Verification:** Network traffic monitoring (Charles Proxy) shows zero outbound requests

**SEC-003: No Third-Party SDKs**
- **Requirement:** No external dependencies that could introduce vulnerabilities
- **Implementation:** Pure SwiftUI/SwiftData stack
- **Verification:** Check `Package.swift` or `Podfile` for zero dependencies

**SEC-004: Secure Coding Practices**
- **Requirement:** No SQL injection, no XSS (even though local-only)
- **Implementation:** SwiftData uses parameterized queries; no raw SQL
- **Verification:** Code review for unsafe string interpolation

**SEC-005: App Transport Security**
- **Requirement:** ATS enabled (even though no network calls)
- **Implementation:** Default iOS ATS settings
- **Verification:** Info.plist check for `NSAllowsArbitraryLoads = false`

### 5.4 Software Quality Attributes

**Usability (Nielsen's Heuristics Compliance):**

| Heuristic | Implementation | Priority |
|-----------|----------------|----------|
| **#1: Visibility of System Status** | Live character counter, delivery date preview | Critical |
| **#2: Match System & Real World** | Emotion labels use plain language ("Comfort" not "Affect-Regulation") | Critical |
| **#3: User Control** | Swipe-to-cancel scheduled Echoes in Settings | Important |
| **#4: Consistency** | iOS-standard UI patterns (no custom navigation) | Critical |
| **#5: Error Prevention** | Disable "Send" button until all fields valid | Critical |
| **#6: Recognition over Recall** | Visual emotion icons, not text-only | Critical |
| **#7: Flexibility** | Keyboard shortcuts for power users (future) | Optional |
| **#8: Aesthetic & Minimalist Design** | <3 primary screens, ample whitespace | **Critical** |
| **#9: Error Recovery** | Undo for accidental dismissals (future) | Optional |
| **#10: Help & Documentation** | Onboarding tutorial on first launch | Important |

**Reliability:**
- **Target:** 99.5% crash-free sessions (measured via Xcode Organizer)
- **Testing:** Automated XCUITest suite covering all critical paths
- **Monitoring:** Manual crash log review (no analytics platform)

**Maintainability:**
- **Code Coverage:** 70%+ unit test coverage for business logic
- **Documentation:** Inline comments for all public APIs
- **Architecture:** MVVM pattern for clear separation of concerns

**Portability:**
- **iOS Versions:** Support iOS 17.0+ (no backward compatibility to iOS 16)
- **Devices:** iPhone 8 to iPhone 15 Pro Max (no iPad version in MVP)

**Accessibility (WCAG 2.1 AA Compliance):**
- **VoiceOver:** All interactive elements have labels
- **Dynamic Type:** Text scales up to Accessibility XXL size
- **Color Contrast:** 4.5:1 minimum ratio for text
- **Haptic Feedback:** Confirmation haptics for critical actions

**Localization (Future):**
- **MVP:** English only
- **v1.1+:** Korean, Japanese (high wellness app adoption)
- **v2.0:** Spanish, French, German

### 5.5 Business Rules

**BR-001: One Vibe per Session (No Bulk Creation)**
- **Rule:** Users can create one Vibe at a time (no "batch send")
- **Rationale:** Encourage mindful, intentional entries (not spamming future self)

**BR-002: No Editing After Send**
- **Rule:** Once a Vibe is sent, it cannot be edited
- **Rationale:** Preserve authenticity of past self's message

**BR-003: Notification Delivery Time Fixed at 09:00**
- **Rule:** All Echoes deliver at 9:00 AM local time (not customizable in MVP)
- **Rationale:** Morning delivery maximizes engagement; simplifies UX

**BR-004: 280-Character Hard Limit**
- **Rule:** Vibe text cannot exceed 280 characters
- **Rationale:** Enforce minimalism; prevent long-form journaling (out of scope)

**BR-005: Emotion Selection Mandatory**
- **Rule:** User must select emotion tag before sending
- **Rationale:** Emotion is required for quote matching and recommendations

**BR-006: No Cloud Backup**
- **Rule:** iCloud sync explicitly disabled for Echo_app data
- **Rationale:** Privacy commitment (users accept risk of data loss if device lost)

**BR-007: Free App, No Ads (MVP)**
- **Rule:** App is free to download with no in-app purchases or ads
- **Rationale:** Prioritize user experience and privacy over monetization in MVP
- **Future:** Potential one-time unlock fee ($2.99-$4.99) in v1.1 for sustainability

**BR-008: No User Accounts**
- **Rule:** No login, no authentication, no user profiles
- **Rationale:** Eliminate server dependency and privacy concerns

**BR-009: Offline-First, Offline-Only**
- **Rule:** App must function 100% offline
- **Rationale:** Core value proposition; no exceptions

---

## 6. Other Requirements

### 6.1 Appendix A: Glossary

| Term | Definition |
|------|------------|
| **Echo** | A time-delayed message that "echoes" back to the user after a set interval |
| **Vibe** | The user-generated text content of an Echo (max 280 characters) |
| **Ebbinghaus Interval** | One of five scientifically-derived time periods (1d, 3d, 7d, 30d, 90d) |
| **Revelation Screen** | The UI view that displays a delivered Echo to the user |
| **Smart Recommendation** | Template-based generated sentence providing context to the Vibe |
| **Quote Match** | An inspirational quote from the local database matched to the Vibe's emotion |
| **Emotional Context** | User-selected category representing the feeling behind the Vibe |
| **Forgetting Curve** | Hermann Ebbinghaus's research showing exponential memory decay over time |
| **Template Bank** | Collection of sentence templates used for Smart Recommendations |
| **Local Processing** | All computation happens on-device with no cloud involvement |

### 6.2 Appendix B: Ebbinghaus Forgetting Curve Model

**Historical Context:**
Hermann Ebbinghaus (1850-1909), German psychologist, conducted groundbreaking research on memory retention. His 1885 work "Memory: A Contribution to Experimental Psychology" introduced the **Forgetting Curve**, demonstrating that:
- Memory retention decays exponentially without reinforcement
- 50% of new information is forgotten within 1 hour without review
- 70% is forgotten within 24 hours
- Spaced repetition significantly improves long-term retention

**Application in Echo_app:**
While Ebbinghaus studied rote memorization, Echo_app applies his principles to **emotional memory reinforcement**:

```
Memory Retention (%)
100% |●
     |  ●
     |    ●
     |      ●
     |        ●___________  ← 1-day Echo (daily reinforcement)
 50% |          ●
     |            ●_______  ← 3-day Echo (short-term accountability)
     |              ●
     |                ●___  ← 7-day Echo (weekly reflection)
     |                  ●
  0% |___________________●_________________________
     0  1d  3d    7d        30d            90d
                Time (days)
```

**Echo_app Intervals Mapped to Curve:**
1. **1-day:** Reinforce daily affirmations before decay begins
2. **3-day:** Catch memories before 50% retention loss
3. **7-day:** Weekly rhythm aligns with work/life cycles
4. **30-day:** Monthly milestones for progress tracking
5. **90-day:** Quarterly perspective for long-term resilience

**Scientific Disclaimer:**
Echo_app is **not a medical device** and does not claim to treat mental illness. The Ebbinghaus model is applied metaphorically for wellness purposes, not clinical therapy.

### 6.3 Appendix C: Emotion Classification System

**Emotion Categories (v1.0):**

| Emotion | Description | Use Cases | Template Examples | Quote Categories |
|---------|-------------|-----------|-------------------|------------------|
| **Achievement** | Celebrating wins, accomplishments | "I got promoted!" | "Remember this strength." | Stoicism, Success |
| **Comfort** | Self-soothing, anxiety management | "Nervous about surgery" | "You'll get through this." | Mindfulness, Courage |
| **Motivation** | Pre-challenge encouragement | "Starting new job Monday" | "You're ready for this." | Psychology, Growth |
| **Gratitude** | Appreciation, thankfulness | "Thankful for my family" | "Hold onto this feeling." | Philosophy, Joy |
| **Struggle** | Processing hardship | "Going through breakup" | "Growth isn't linear." | Stoicism, Resilience |
| **Joy** | Pure happiness | "Just got engaged!" | "Savor this moment." | Poetry, Celebration |
| **Reflection** | Thoughtful introspection | "Learned valuable lesson" | "Wisdom from experience." | Literature, Learning |
| **Hope** | Optimism for future | "Excited for new chapter" | "Trust your journey." | Philosophy, Inspiration |

**Emotion Selection UI:**
- Horizontal scrollable picker
- Each emotion represented by:
  - Icon (custom SF Symbol)
  - Label (emotion name)
  - Color accent (subtle differentiation)

**Future Expansion (v2.0):**
- Allow users to create custom emotions
- Track emotion patterns over time ("You use 'Comfort' most on Sundays")

### 6.4 Appendix D: To Be Determined List

**Items Requiring User Research / Testing:**

1. **Optimal Notification Delivery Time**
   - **Current:** Fixed at 09:00
   - **TBD:** Should users customize delivery time? (May add complexity)
   - **Research Method:** A/B test in beta with 09:00 vs. user-selected time

2. **Emotion Category Refinement**
   - **Current:** 8 emotions
   - **TBD:** Is 8 too many? Too few? Should we collapse categories?
   - **Research Method:** Usability testing with 20 participants

3. **Character Limit (280 vs. 140 vs. Unlimited)**
   - **Current:** 280 (Twitter-inspired)
   - **TBD:** Does limit feel restrictive or helpful?
   - **Research Method:** User interviews post-beta

4. **Quote Attribution Requirement**
   - **Current:** Always show author name
   - **TBD:** Some users may prefer anonymous quotes for cleaner UI
   - **Research Method:** Preference survey

5. **Vibe History Access**
   - **Current:** Not implemented in MVP (Echoes disappear after viewing)
   - **TBD:** Should users have a "Journal" view of past Echoes?
   - **Research Method:** Feature request tracking post-launch

6. **Monetization Strategy**
   - **Current:** Free, no ads
   - **TBD:** One-time unlock fee ($2.99)? Freemium? Donations?
   - **Research Method:** Market analysis of wellness app pricing

7. **International Launch Priority**
   - **Current:** English only
   - **TBD:** Which languages first? Korean? Japanese? Spanish?
   - **Research Method:** App Store demographics analysis

**Items Pending Technical Validation:**

8. **SwiftData Performance with 1,000+ Vibes**
   - **TBD:** Does query performance degrade? Need indexing?
   - **Testing:** Stress test with simulated 2,000 Vibes

9. **Notification Reliability on iOS 17.5+**
   - **TBD:** Any known bugs in UserNotifications framework?
   - **Testing:** Beta testing across iOS versions

10. **Dark Mode Color Palette**
    - **TBD:** Finalize color scheme for dark mode
    - **Testing:** Accessibility audit for contrast ratios

---

*[End of Section 6: Other Requirements]*

---

## Document Approval

**Version:** 2.0
**Status:** Draft for Review
**Last Updated:** 2025-11-18

**Prepared By:** Project Manager & Lead iOS Developer
**Reviewed By:** [Pending User Approval]

**Approval Sign-Off:**
- [ ] Product Owner: _____________________________ Date: _______
- [ ] Lead Developer: ____________________________ Date: _______
- [ ] QA Lead: ___________________________________ Date: _______

**Change Log:**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-11-18 | PM | Initial SRS for Lapse_app (365-day time capsule concept) |
| 2.0 | 2025-11-18 | PM | Major pivot to Echo_app (Ebbinghaus-based memory reinforcement) |

---

*[End of Software Requirements Specification]*
