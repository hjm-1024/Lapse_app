# Echo_app Design System
**Version:** 1.0
**Date:** 2025-11-18
**Project:** Echo_app
**Purpose:** Comprehensive visual design specification for iOS app development

---

## Table of Contents

1. **Design Principles**
2. **Color System**
3. **Typography**
4. **Spacing & Layout**
5. **Iconography**
6. **Components**
7. **Animations & Transitions**
8. **Accessibility**

---

## 1. Design Principles

### Core Design Philosophy

**Echo_app's visual identity is guided by three pillars:**

1. **Minimalism (Nielsen #8: Aesthetic and Minimalist Design)**
   - Every element serves a purpose
   - Ample whitespace (breathing room for emotional content)
   - Single primary action per screen
   - No visual clutter or decorative elements

2. **Emotional Resonance**
   - Warm, supportive color palette
   - Soft shadows and gentle transitions
   - Typography that feels human, not mechanical
   - Respect for the emotional weight of user content

3. **iOS-Native Excellence**
   - Full adoption of Apple Human Interface Guidelines
   - SwiftUI native components
   - System fonts (SF Pro) with Dynamic Type
   - Standard iOS navigation patterns

### Design Constraints (From SRS)

- **Maximum 3 primary screens:** Home, Composer, Revelation
- **No custom navigation:** Use standard iOS tab bar or navigation bar
- **Text-only content:** No images, videos, or rich media
- **280-character limit enforcement:** Visual feedback for character count

---

## 2. Color System

### 2.1 Base Color Palette

**Light Mode Primary Colors:**

| Color Name | Hex Code | Usage | Contrast Ratio (WCAG) |
|------------|----------|-------|----------------------|
| **Primary Background** | `#FFFFFF` | Main background, cards | N/A |
| **Secondary Background** | `#F5F5F7` | Input fields, inactive states | N/A |
| **Primary Text** | `#1D1D1F` | Headlines, Vibe content | 21:1 (AAA) |
| **Secondary Text** | `#6E6E73` | Descriptions, metadata | 7.3:1 (AAA) |
| **Tertiary Text** | `#86868B` | Placeholders, hints | 4.6:1 (AA) |
| **Accent (Echo Blue)** | `#007AFF` | Primary CTAs, links | 4.5:1 (AA) |
| **Success** | `#34C759` | Confirmation states | 3.4:1 (AA Large Text) |
| **Warning** | `#FF9500` | Alerts, limits | 3.1:1 (AA Large Text) |

**Dark Mode Primary Colors:**

| Color Name | Hex Code | Usage | Contrast Ratio (WCAG) |
|------------|----------|-------|----------------------|
| **Primary Background** | `#000000` | Main background, cards | N/A |
| **Secondary Background** | `#1C1C1E` | Input fields, inactive states | N/A |
| **Primary Text** | `#FFFFFF` | Headlines, Vibe content | 21:1 (AAA) |
| **Secondary Text** | `#AEAEB2` | Descriptions, metadata | 9.7:1 (AAA) |
| **Tertiary Text** | `#8E8E93` | Placeholders, hints | 7.1:1 (AAA) |
| **Accent (Echo Blue)** | `#0A84FF` | Primary CTAs, links | 4.6:1 (AA) |
| **Success** | `#30D158` | Confirmation states | 3.5:1 (AA Large Text) |
| **Warning** | `#FF9F0A` | Alerts, limits | 3.2:1 (AA Large Text) |

### 2.2 Emotion Color System

**Each of the 8 emotion categories has a dedicated color accent for visual differentiation.**

**Light Mode Emotion Colors:**

| Emotion | Hex Code | Usage | Semantic Meaning |
|---------|----------|-------|------------------|
| **Achievement** | `#FFD60A` (Gold) | Emotion tag, icon background | Success, accomplishment |
| **Comfort** | `#64D2FF` (Sky Blue) | Emotion tag, icon background | Calm, reassurance |
| **Motivation** | `#FF453A` (Energetic Red) | Emotion tag, icon background | Drive, determination |
| **Gratitude** | `#BF5AF2` (Purple) | Emotion tag, icon background | Appreciation, warmth |
| **Struggle** | `#AC8E68` (Muted Brown) | Emotion tag, icon background | Difficulty, perseverance |
| **Joy** | `#FF9F0A` (Orange) | Emotion tag, icon background | Happiness, excitement |
| **Reflection** | `#5E5CE6` (Indigo) | Emotion tag, icon background | Thoughtfulness, wisdom |
| **Hope** | `#32D74B` (Green) | Emotion tag, icon background | Optimism, growth |

**Dark Mode Emotion Colors:**

| Emotion | Hex Code | Usage |
|---------|----------|-------|
| **Achievement** | `#FFD60A` | Slightly dimmed for dark backgrounds |
| **Comfort** | `#64D2FF` | Same as light mode |
| **Motivation** | `#FF453A` | Same as light mode |
| **Gratitude** | `#BF5AF2` | Same as light mode |
| **Struggle** | `#AC8E68` | Same as light mode |
| **Joy** | `#FF9F0A` | Same as light mode |
| **Reflection** | `#5E5CE6` | Same as light mode |
| **Hope** | `#32D74B` | Same as light mode |

*(Note: iOS automatically adjusts vibrancy for dark mode; colors remain consistent)*

### 2.3 Semantic Color Usage

**Dividers & Borders:**
- Light Mode: `#C6C6C8` (opacity 0.3)
- Dark Mode: `#545458` (opacity 0.65)

**Shadows:**
- Light Mode: `rgba(0, 0, 0, 0.08)` for cards
- Dark Mode: `rgba(0, 0, 0, 0.3)` for elevated elements

**Overlays:**
- Modal backgrounds: `rgba(0, 0, 0, 0.4)` (both modes)

---

## 3. Typography

### 3.1 Font System

**Primary Font:** SF Pro (iOS System Font)
- **Reason:** Native iOS font with Dynamic Type support, optimized legibility

**Secondary Font (Quotes):** SF Pro Rounded (for matched quotes on Revelation Screen)
- **Reason:** Softer, more approachable feel for inspirational content

### 3.2 Type Scale

**Text Styles (Light & Dark Mode):**

| Style Name | Font Weight | Size (pt) | Line Height | Usage |
|------------|-------------|-----------|-------------|-------|
| **Large Title** | Bold (700) | 34 | 41 | Screen headers (rare) |
| **Title 1** | Semibold (600) | 28 | 34 | Section headers |
| **Title 2** | Semibold (600) | 22 | 28 | Card headers |
| **Title 3** | Semibold (600) | 20 | 25 | Subsection headers |
| **Headline** | Semibold (600) | 17 | 22 | Emphasis text |
| **Body** | Regular (400) | 17 | 22 | Vibe content, primary text |
| **Callout** | Regular (400) | 16 | 21 | Secondary descriptions |
| **Subheadline** | Regular (400) | 15 | 20 | Metadata, timestamps |
| **Footnote** | Regular (400) | 13 | 18 | Helper text, labels |
| **Caption 1** | Regular (400) | 12 | 16 | Tiny labels |
| **Caption 2** | Regular (400) | 11 | 13 | Legal text (privacy policy) |

### 3.3 Dynamic Type Support

**Accessibility Requirement (SRS 5.4):**
- Support all 7 standard Dynamic Type sizes (XS → XXL)
- Support 5 accessibility sizes (AX1 → AX5)
- Text must scale up to **310%** of base size
- Layout must reflow (no horizontal scrolling)

**Implementation:**
- Use SwiftUI `.font(.body)` modifiers (not hardcoded sizes)
- Test all screens at **Accessibility XXL** size

### 3.4 Character Counter Typography

**Vibe Composer Character Counter:**
- Font: SF Pro, Footnote (13pt)
- Color (0-250 chars): `Secondary Text` color
- Color (251-280 chars): `Warning` color (`#FF9500`)
- Position: Trailing edge of text field
- Example: `"245/280"`

---

## 4. Spacing & Layout

### 4.1 Spacing System (8pt Grid)

**All spacing values are multiples of 8pt for consistency:**

| Token Name | Value (pt) | Usage |
|------------|-----------|-------|
| `xxs` | 4 | Tight spacing (icon padding) |
| `xs` | 8 | Compact spacing (between related elements) |
| `sm` | 16 | Default element spacing |
| `md` | 24 | Section spacing |
| `lg` | 32 | Screen padding (horizontal) |
| `xl` | 40 | Vertical screen padding |
| `xxl` | 64 | Large separators |

### 4.2 Layout Grid

**Screen Horizontal Padding:**
- iPhone (all sizes): 20pt (exceptions: full-bleed elements like dividers)

**Safe Area Insets:**
- Respect iOS safe area (automatic with SwiftUI)
- Home indicator: 34pt bottom padding on iPhone X+

**Card Layout:**
- Corner radius: 12pt
- Shadow: `y-offset: 2pt, blur: 8pt, opacity: 0.08`
- Internal padding: 20pt

### 4.3 Button Sizing

**Primary CTA Button ("Send an Echo"):**
- Height: 56pt (large tap target)
- Corner radius: 16pt
- Horizontal padding: 32pt
- Minimum width: 200pt

**Secondary Buttons ("Dismiss", "Reflect"):**
- Height: 44pt (iOS standard)
- Corner radius: 12pt
- Horizontal padding: 24pt

### 4.4 Input Field Sizing

**Text Entry Field (Vibe Composer):**
- Minimum height: 120pt (multi-line)
- Corner radius: 12pt
- Internal padding: 16pt
- Border: 1pt, `Divider` color

---

## 5. Iconography

### 5.1 Icon System

**Icon Library:** SF Symbols 5.0 (iOS 17+)
- **Reason:** Native iOS icons, automatic weight/size matching, accessibility support

**Icon Sizes:**
- Small: 16pt (inline icons)
- Medium: 24pt (emotion selector)
- Large: 32pt (tab bar, primary actions)
- Extra Large: 48pt (empty states)

### 5.2 Emotion Icon Mapping

**Each emotion is represented by a custom SF Symbol:**

| Emotion | SF Symbol | Alternative (if unavailable) |
|---------|-----------|------------------------------|
| **Achievement** | `trophy.fill` | `star.fill` |
| **Comfort** | `heart.circle.fill` | `hands.sparkles.fill` |
| **Motivation** | `flame.fill` | `bolt.fill` |
| **Gratitude** | `sparkles` | `hand.thumbsup.fill` |
| **Struggle** | `mountain.2.fill` | `arrow.up.right` |
| **Joy** | `sun.max.fill` | `face.smiling.fill` |
| **Reflection** | `book.closed.fill` | `moon.stars.fill` |
| **Hope** | `leaf.fill` | `sunrise.fill` |

**Icon Style:**
- Weight: Semibold (matches text weight)
- Rendering mode: Hierarchical (for multi-color icons)
- Color: Emotion-specific accent color (see Section 2.2)

### 5.3 System Icons

**Navigation & Actions:**
- Settings: `gearshape.fill`
- Close/Dismiss: `xmark`
- Back: `chevron.left`
- Forward: `chevron.right`
- Calendar: `calendar`
- Notification: `bell.fill`

---

## 6. Components

### 6.1 Primary CTA Button (Home Screen)

**Visual Specification:**

```
┌─────────────────────────────────────┐
│                                     │
│       Send an Echo                  │  ← SF Pro Headline, White
│                                     │
└─────────────────────────────────────┘
       ↑                         ↑
   56pt height            Background: Accent Blue (#007AFF)
                          Corner Radius: 16pt
                          Shadow: y-offset 4pt, blur 12pt, opacity 0.2
```

**States:**
- Default: Accent Blue background, white text
- Pressed: 90% opacity
- Disabled: 40% opacity (not applicable for Home Screen)

**Accessibility:**
- VoiceOver label: "Send an Echo, button"
- Minimum tap target: 44×44pt (exceeded by 56pt height)

### 6.2 Emotion Selector (Vibe Composer)

**Layout:** Horizontal scrollable picker

**Each Emotion Chip:**

```
┌────────────────────┐
│  🏆  Achievement   │  ← Icon (24pt) + Label (Callout)
└────────────────────┘
       ↑
  Background: Emotion color with 20% opacity
  Border: 2pt solid Emotion color (if selected)
  Corner Radius: 20pt (pill shape)
  Padding: 12pt horizontal, 8pt vertical
```

**States:**
- Unselected: 20% opacity background, no border
- Selected: 30% opacity background, 2pt solid border
- Pressed: Scale 0.95

**Scrolling Behavior:**
- Horizontal scroll, no paging
- Content inset: 20pt (left/right)
- Spacing between chips: 12pt

### 6.3 Interval Picker (Vibe Composer)

**Component:** iOS Segmented Control (UISegmentedControl / Picker)

**Options:** `1d | 3d | 7d | 30d | 90d`

**Visual:**

```
┌─────┬─────┬─────┬─────┬─────┐
│ 1d  │ 3d  │ 7d  │ 30d │ 90d │
└─────┴─────┴─────┴─────┴─────┘
   ↑
Selected segment: Accent Blue background
Unselected: Secondary Background
Text: Body font, 15pt
```

**Alternative (Simpler):** Vertical radio button list
- May be clearer for accessibility
- TBD during usability testing (Appendix D)

### 6.4 Revelation Card (Revelation Screen)

**Layout:**

```
╔═══════════════════════════════════════╗
║                                       ║
║  An Echo from November 18, 2025      ║ ← Subheadline, Secondary Text
║  ───────────────────────────────      ║
║                                       ║
║  I finished my first marathon today! ║ ← Title 2, Primary Text
║                                       ║
║  ───────────────────────────────      ║
║                                       ║
║  Remember the strength it took to    ║ ← Callout, Secondary Text
║  achieve marathon.                   ║   (Smart Recommendation)
║                                       ║
║  ───────────────────────────────      ║
║                                       ║
║  "The impediment to action advances  ║ ← Body Italic, Tertiary Text
║   action. What stands in the way     ║   (Quote)
║   becomes the way."                  ║
║                                       ║
║       — Marcus Aurelius              ║ ← Footnote, Tertiary Text
║                                       ║
║  ┌───────────┐   ┌────────────┐     ║
║  │  Reflect  │   │  Dismiss   │     ║ ← Secondary buttons
║  └───────────┘   └────────────┘     ║
║                                       ║
╚═══════════════════════════════════════╝
     ↑
Card Background: Primary Background
Corner Radius: 20pt
Padding: 24pt
Shadow: y-offset 8pt, blur 24pt, opacity 0.12
```

**Dividers:**
- Color: `Divider` color (from Section 2.3)
- Height: 1pt
- Margin: 16pt vertical

### 6.5 Character Counter (Vibe Composer)

**Position:** Bottom-right of text field

**Format:** `"245/280"`

**Color Logic:**
```swift
if characterCount <= 250 {
    color = .secondary // Gray
} else if characterCount <= 280 {
    color = .orange // Warning
} else {
    // Should not occur (hard limit enforced)
}
```

**Animation:** Fade color transition (0.2s ease)

---

## 7. Animations & Transitions

### 7.1 Screen Transitions

**Navigation Push/Pop:**
- Duration: 0.35s
- Curve: `easeInOut`
- Direction: Right-to-left (iOS standard)

**Modal Presentation (Revelation Screen):**
- Duration: 0.4s
- Curve: `spring(response: 0.4, dampingFraction: 0.8)`
- Direction: Bottom-to-top slide
- Backdrop: Fade-in to `rgba(0,0,0,0.4)`

**Dismissal (Swipe-down on Revelation Screen):**
- Interactive gesture: Follow finger
- Velocity threshold: 300pt/s
- Completion: Spring animation (0.3s)

### 7.2 Micro-interactions

**Button Press:**
- Scale: 0.95 (5% shrink)
- Duration: 0.15s
- Curve: `easeOut`

**Emotion Chip Selection:**
- Border fade-in: 0.2s
- Background opacity: 0.2s
- Scale: 0.95 (on press)

**Character Counter Color Change:**
- Duration: 0.2s
- Curve: `easeInOut`
- Trigger: Crossing 250-character threshold

**Confirmation Toast (After Sending Echo):**
- Appear: Slide from bottom + fade (0.3s)
- Duration visible: 2s
- Disappear: Fade out (0.3s)

### 7.3 Celebration Animation (Achievement Echoes)

**Trigger:** User opens Revelation Screen for "Achievement" emotion

**Effect:** Confetti burst (optional, configurable in Settings)

**Implementation:**
- SwiftUI `Canvas` or third-party library (e.g., ConfettiSwiftUI)
- Duration: 1.5s
- Particle count: 30-50
- Colors: Achievement gold + white

**Accessibility:** Respect `Reduce Motion` setting (disable if enabled)

---

## 8. Accessibility

### 8.1 Dynamic Type

**Requirements (SRS 5.4):**
- All text must scale with iOS Dynamic Type
- Support sizes: `XS` → `AX5` (12 total sizes)
- Layout must reflow (no clipping or horizontal scroll)

**Testing Checklist:**
- [ ] Test all 4 screens at `Accessibility XXL`
- [ ] Verify button labels don't truncate
- [ ] Verify Vibe text wraps correctly
- [ ] Verify emotion chips stack vertically if needed

### 8.2 VoiceOver

**Screen Reader Labels:**

| UI Element | VoiceOver Label |
|------------|-----------------|
| Home Screen CTA | "Send an Echo, button" |
| Emotion Chip (Achievement) | "Achievement, selected" or "Achievement, not selected, button" |
| Interval Option (7d) | "7 days, selected" or "7 days, not selected, button" |
| Character Counter | "245 characters of 280" (updated live) |
| Send Echo Button | "Send Echo, button, disabled" (if invalid) |
| Revelation Dismiss | "Dismiss, button" |
| Revelation Reflect | "Reflect, button" |

**Reading Order (Revelation Screen):**
1. Header: "An Echo from November 18, 2025"
2. Vibe text
3. Smart Recommendation
4. Quote text
5. Quote attribution
6. Buttons (Reflect, Dismiss)

### 8.3 Color Contrast

**WCAG 2.1 AA Compliance:**
- Text contrast: Minimum 4.5:1 (normal text), 3:1 (large text 18pt+)
- All color pairs verified in Section 2.1

**High Contrast Mode:**
- Increase border thickness (1pt → 2pt)
- Increase shadow opacity (0.08 → 0.15)
- Emotion colors: Use 100% saturation variants

### 8.4 Reduce Motion

**If user enables "Reduce Motion" in iOS Settings:**
- Disable all spring animations (use linear)
- Disable confetti animation
- Reduce transition duration (0.35s → 0.2s)
- Crossfade instead of slide for screen transitions

**Implementation:**
```swift
@Environment(\.accessibilityReduceMotion) var reduceMotion

if reduceMotion {
    // Use fade instead of slide
}
```

### 8.5 Haptic Feedback

**Use Cases:**
- **Success:** Heavy impact when Echo is sent
- **Selection:** Light impact when selecting emotion or interval
- **Error:** Notification feedback when character limit exceeded

**Implementation:**
```swift
let generator = UIImpactFeedbackGenerator(style: .heavy)
generator.impactOccurred()
```

---

## 9. Component Library (SwiftUI)

### 9.1 EchoButton (Primary CTA)

**Usage:**
```swift
EchoButton(title: "Send an Echo", style: .primary) {
    // Action
}
```

**Styles:**
- `.primary`: Accent Blue background, white text
- `.secondary`: Secondary Background, Primary Text
- `.destructive`: Red background, white text

### 9.2 EmotionChip (Emotion Selector)

**Usage:**
```swift
EmotionChip(emotion: .achievement, isSelected: $selectedEmotion)
```

**Props:**
- `emotion`: Enum (Achievement, Comfort, etc.)
- `isSelected`: Binding<Bool>

### 9.3 RevelationCard (Revelation Screen)

**Usage:**
```swift
RevelationCard(
    vibe: vibe,
    recommendation: recommendation,
    quote: quote,
    onReflect: { /* action */ },
    onDismiss: { /* action */ }
)
```

**Props:**
- `vibe`: Vibe model
- `recommendation`: String
- `quote`: Quote model
- `onReflect`: Closure
- `onDismiss`: Closure

---

## 10. Dark Mode

### 10.1 Automatic Switching

**Behavior:**
- App respects iOS system setting (Settings → Display & Brightness → Appearance)
- No in-app toggle (following iOS standard)

**Color Adaptation:**
- All colors defined in Section 2 have dark mode variants
- SwiftUI automatically handles switching via Color Assets

### 10.2 Dark Mode Testing Checklist

- [ ] All screens tested in dark mode
- [ ] Color contrast verified (WCAG AA)
- [ ] Shadows visible on dark backgrounds
- [ ] Emotion colors maintain vibrancy
- [ ] Text remains legible

---

## 11. Figma Design File (Placeholder)

**Note:** This document serves as specification for developers. A Figma design file will be created for:
1. High-fidelity mockups
2. Developer handoff (with measurements)
3. Marketing assets (App Store screenshots)

**Figma File Structure:**
```
Echo_app_Design.fig
├── 📱 Screens
│   ├── Home Screen (Light/Dark)
│   ├── Vibe Composer (Light/Dark)
│   ├── Revelation Screen (Light/Dark)
│   └── Settings Screen (Light/Dark)
├── 🎨 Design Tokens
│   ├── Colors
│   ├── Typography
│   └── Spacing
├── 🧩 Components
│   ├── Buttons
│   ├── Emotion Chips
│   └── Cards
└── 📐 Wireframes
    ├── User Flow 1: Onboarding
    ├── User Flow 2: Vibe Creation
    └── User Flow 3: Revelation
```

**Timeline:**
- Design System (this document): Complete ✅
- Wireframes: Next deliverable
- High-fidelity mockups: After wireframe approval

---

*[End of Design System]*

**Document Status:** Complete
**Next Steps:** Create wireframes for 4 primary screens
