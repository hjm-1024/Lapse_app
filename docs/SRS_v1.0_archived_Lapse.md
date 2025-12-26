# Software Requirements Specification (SRS)
## Lapse_app - Vibe Time Capsule

**Document Version:** 1.0
**Date:** 2025-11-18
**Project:** Lapse_app
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
   - 4.1 Vibe Recording
   - 4.2 Data Persistence
   - 4.3 Time-Delayed Notification System
   - 4.4 Vibe Revelation

5. **Non-Functional Requirements**
   - 5.1 Performance Requirements
   - 5.2 Safety Requirements
   - 5.3 Security Requirements
   - 5.4 Software Quality Attributes
   - 5.5 Business Rules

6. **Other Requirements**
   - 6.1 Appendix A: Glossary
   - 6.2 Appendix B: Analysis Models
   - 6.3 Appendix C: To Be Determined List

---

## 1. Introduction

### 1.1 Purpose

This Software Requirements Specification (SRS) document provides a comprehensive description of the requirements for **Lapse_app**, an iOS application designed to deliver a minimalist, privacy-first time capsule experience.

The document is intended to serve multiple purposes:
- **Investment & Stakeholder Communication:** Provide clear project vision and scope for funding decisions
- **Development Guidance:** Define functional and non-functional requirements for the engineering team
- **Quality Assurance:** Establish testable criteria for validation and verification
- **App Store Submission:** Document core features and compliance requirements

This SRS adheres to IEEE 830-1998 standard while maintaining focus on the core "Vibe" of the product: **simplicity, privacy, and emotional resonance**.

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
- **Vibe:** A single user-generated text entry (max 280 characters) representing a moment, feeling, or thought
- **Time Capsule:** The mechanism by which a Vibe is stored and scheduled for future revelation
- **Revelation:** The event of displaying a one-year-old Vibe to the user via notification and in-app view

### 1.3 Intended Audience and Reading Suggestions

| Audience | Recommended Sections | Purpose |
|----------|---------------------|---------|
| **Investors/Stakeholders** | 1, 2, 5 | Understand product vision, market fit, and quality standards |
| **iOS Developers** | 3, 4, 2.5 | Implement features according to technical specifications |
| **UI/UX Designers** | 2.1, 2.2, 4, 5.4 | Design interfaces that align with minimalist principles |
| **QA Engineers** | 3, 4, 5 | Develop test plans and acceptance criteria |
| **Project Managers** | All sections | Track progress and validate deliverables |

**Reading Suggestions:**
1. Start with Section 1.4 (Project Scope) to understand the product vision
2. Review Section 2 (Overall Description) for product context
3. Deep-dive into Sections 3-4 for detailed requirements
4. Consult Section 5 for quality benchmarks

### 1.4 Project Scope

**Product Name:** Lapse_app

**Tagline:** "Your Vibe, One Year Later"

**Core Concept:**
Lapse_app is a minimalist iOS application that transforms daily moments into future gifts. Users record a single sentence (a "Vibe") each day, which immediately disappears from view after submission. Exactly **365 days later**, the Vibe resurfaces via local push notification, creating a moment of reflection, surprise, and emotional connection with one's past self.

**Primary Objectives:**
1. **Reduce Cognitive Load:** Eliminate the burden of traditional journaling through single-sentence entries
2. **Maximize Emotional Impact:** Leverage the "gift effect" of time-delayed revelation
3. **Ensure Privacy:** 100% local data storage with zero cloud dependency or analytics tracking
4. **Deliver Reliability:** Guarantee notification delivery using iOS UserNotifications framework

**Key Differentiators:**
- **No Server Infrastructure:** Entire app operates offline; no authentication, no backend costs
- **Enforced Minimalism:** One Vibe per day maximum (adhering to Nielsen's Heuristic #8: Aesthetic and Minimalist Design)
- **Predictable Delight:** Fixed 365-day delay creates annual rhythm and anticipation
- **Zero Maintenance:** Users never "manage" past entries; the app manages revelation timing

**Out of Scope (Explicitly Excluded):**
- Multi-user or social features
- Cloud sync or backup
- Export/import functionality
- Rich media (photos, videos, audio)
- Customizable notification timing
- Analytics or usage tracking

**Success Metrics (Post-Launch):**
- **Retention Rate:** 40%+ users still recording Vibes after 90 days
- **Notification Engagement:** 60%+ users open notifications when delivered
- **App Store Rating:** 4.5+ stars with <2% crash rate
- **Privacy Compliance:** Zero data breach incidents, full GDPR/CCPA adherence

### 1.5 References

**Technical Standards:**
- Apple Human Interface Guidelines (iOS 17+): https://developer.apple.com/design/human-interface-guidelines/
- SwiftUI Framework Documentation: https://developer.apple.com/documentation/swiftui/
- SwiftData Framework Documentation: https://developer.apple.com/documentation/swiftdata/
- UserNotifications Framework: https://developer.apple.com/documentation/usernotifications/

**Design Philosophy:**
- Nielsen Norman Group - 10 Usability Heuristics: https://www.nngroup.com/articles/ten-usability-heuristics/
- Dieter Rams - 10 Principles of Good Design

**Compliance & Legal:**
- Apple App Store Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- GDPR (General Data Protection Regulation)
- CCPA (California Consumer Privacy Act)

**Project Management:**
- IEEE 830-1998: Recommended Practice for Software Requirements Specifications

---

*[End of Section 1: Introduction]*

*Status: Section 1 Complete | Next: Section 2 - Overall Description*
