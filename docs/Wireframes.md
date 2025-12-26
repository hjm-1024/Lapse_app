# Echo_app Wireframes
**Version:** 1.0
**Date:** 2025-11-18
**Project:** Echo_app
**Purpose:** Low-fidelity wireframes for iOS app development

---

## Table of Contents

1. **Home Screen**
2. **Vibe Composer Screen**
3. **Revelation Screen**
4. **Settings Screen**
5. **Component Annotations**

---

## 1. Home Screen

### 1.1 Default State (No Scheduled Echoes)

```
┌─────────────────────────────────────┐
│  ☰                          ⚙︎      │ ← Navigation Bar
│                                     │   (☰ = Menu icon if needed, ⚙︎ = Settings)
├─────────────────────────────────────┤
│                                     │
│                                     │
│                                     │
│            Echo                     │ ← App Logo (Title 1, centered)
│                                     │
│                                     │
│     Your Voice from the Past,       │ ← Tagline (Callout, Secondary Text)
│        When You Need It Most        │
│                                     │
│                                     │
│                                     │
│                                     │
│   ┌───────────────────────────┐    │
│   │                           │    │
│   │    Send an Echo           │    │ ← Primary CTA Button
│   │                           │    │   (Height: 56pt, Blue)
│   └───────────────────────────┘    │
│                                     │
│                                     │
│         No Echoes scheduled         │ ← Empty State Text (Footnote)
│                                     │
│                                     │
│                                     │
│                                     │
│                                     │
│                                     │
└─────────────────────────────────────┘
   ↑                             ↑
iPhone frame (375×812pt)    Safe area
```

**Layout Specifications:**
- Navigation bar: 44pt height
- Logo: 200pt from top
- CTA button: Centered horizontally, 300pt from top
- Empty state text: 40pt below button

**Accessibility:**
- VoiceOver focus order: Settings icon → Logo → CTA button
- Dynamic Type: Logo scales with Large Title, button label scales with Headline

---

### 1.2 Active State (3 Echoes Scheduled)

```
┌─────────────────────────────────────┐
│  ☰                          ⚙︎      │
│                                     │
├─────────────────────────────────────┤
│                                     │
│                                     │
│            Echo                     │
│                                     │
│     Your Voice from the Past,       │
│        When You Need It Most        │
│                                     │
│                                     │
│   ┌───────────────────────────┐    │
│   │                           │    │
│   │    Send an Echo           │    │
│   │                           │    │
│   └───────────────────────────┘    │
│                                     │
│                                     │
│      ┌─────────────────────┐       │ ← Upcoming Echoes Card
│      │ 📆 3 Echoes Scheduled│       │   (Secondary Background)
│      │                     │       │
│      │ • Nov 19 (1 day)    │       │   • = Emotion color dot
│      │ • Nov 21 (3 days)   │       │
│      │ • Nov 25 (7 days)   │       │
│      │                     │       │
│      │   View All →        │       │   ← Tap to open list
│      └─────────────────────┘       │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Interaction:**
- "View All →" tap → Navigate to Settings → Manage Scheduled Echoes

**Upcoming Echoes Card:**
- Corner radius: 12pt
- Padding: 16pt
- Show max 3 nearest Echoes
- Each Echo: Date + interval label + emotion color indicator

---

## 2. Vibe Composer Screen

### 2.1 Initial State (Empty)

```
┌─────────────────────────────────────┐
│  ✕           New Echo          ⚙︎   │ ← Navigation Bar (Title: "New Echo")
│                                     │   (✕ = Close/Cancel, ⚙︎ = Settings)
├─────────────────────────────────────┤
│                                     │
│  ┌───────────────────────────────┐ │
│  │                               │ │
│  │  What's on your mind?         │ │ ← Placeholder text (Tertiary)
│  │                               │ │
│  │                               │ │
│  │                               │ │ ← Text Field (Multi-line)
│  │                               │ │   Height: 120pt min
│  │                               │ │   Expands with content
│  │                        0/280  │ │ ← Character counter (Bottom-right)
│  └───────────────────────────────┘ │
│                                     │
│  Choose an emotion                  │ ← Section Label (Callout)
│                                     │
│  ┌─────────────────────────────┐   │
│  │🏆 Achievement  💙 Comfort  ⚡...│ │ ← Horizontal scrollable
│  └─────────────────────────────┘   │   Emotion chips
│     ← → (scroll indicator)          │
│                                     │
│  When should this Echo arrive?      │ ← Section Label
│                                     │
│  ┌─────┬─────┬─────┬─────┬─────┐  │
│  │ 1d  │ 3d  │ 7d  │ 30d │ 90d │  │ ← Segmented Control
│  └─────┴─────┴─────┴─────┴─────┘  │
│                                     │
│  Arrives on ____________            │ ← Delivery date preview
│                                     │   (Placeholder until interval selected)
│                                     │
│                                     │
│   ┌───────────────────────────┐    │
│   │      Send Echo            │    │ ← Primary CTA (Disabled state)
│   └───────────────────────────┘    │   Gray, 40% opacity
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Validation States:**
- Send button **disabled** until:
  - Text length: 1-280 characters
  - Emotion selected
  - Interval selected

---

### 2.2 Filled State (Ready to Send)

```
┌─────────────────────────────────────┐
│  ✕           New Echo          ⚙︎   │
│                                     │
├─────────────────────────────────────┤
│                                     │
│  ┌───────────────────────────────┐ │
│  │ I finished my first marathon  │ │
│  │ today! Feeling proud and      │ │ ← User text (Body font)
│  │ exhausted. This is a huge     │ │
│  │ accomplishment for me.        │ │
│  │                               │ │
│  │                               │ │
│  │                      126/280  │ │ ← Counter (Gray, <250 chars)
│  └───────────────────────────────┘ │
│                                     │
│  Choose an emotion                  │
│                                     │
│  ┌─────────────────────────────┐   │
│  │[🏆 Achievement]  💙 Comfort  ...│ │ ← First chip selected (border)
│  └─────────────────────────────┘   │   Background: Gold 30% opacity
│                                     │   Border: 2pt solid Gold
│                                     │
│  When should this Echo arrive?      │
│                                     │
│  ┌─────┬─────┬─────┬─────┬─────┐  │
│  │ 1d  │ 3d  │[7d] │ 30d │ 90d │  │ ← "7d" selected (Blue background)
│  └─────┴─────┴─────┴─────┴─────┘  │
│                                     │
│  Arrives on November 25, 2025       │ ← Preview (Bold, Accent Blue)
│          at 9:00 AM                 │   (Calculated: Current date + 7d)
│                                     │
│                                     │
│   ┌───────────────────────────┐    │
│   │      Send Echo            │    │ ← Primary CTA (Enabled)
│   └───────────────────────────┘    │   Full Blue, white text
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Interaction Flow:**
1. User types text → Character counter updates in real-time
2. User selects emotion → Chip border appears, background brightens
3. User selects interval → Preview calculates and displays date
4. All 3 filled → "Send Echo" button activates
5. Tap "Send Echo" → Confirmation toast → Return to Home Screen

**Character Counter Color States:**
- 0-250 chars: Secondary Text (`#6E6E73`)
- 251-280 chars: Warning Orange (`#FF9500`)

---

### 2.3 Near Limit State (270 chars)

```
┌─────────────────────────────────────┐
│  ✕           New Echo          ⚙︎   │
│                                     │
├─────────────────────────────────────┤
│                                     │
│  ┌───────────────────────────────┐ │
│  │ I finished my first marathon  │ │
│  │ today! Feeling proud and      │ │
│  │ exhausted. This is a huge     │ │
│  │ accomplishment for me. I've   │ │
│  │ trained for 6 months and it   │ │
│  │ finally paid off. Can't wait  │ │
│  │ to see how I feel about this  │ │
│  │ in a week when my legs stop   │ │
│  │ hurting!                      │ │
│  │                      270/280  │ │ ← Counter (Orange, warning)
│  └───────────────────────────────┘ │
│                                     │
│  Choose an emotion                  │
│  [Selected emotion chips...]        │
│                                     │
│  When should this Echo arrive?      │
│  [Selected interval...]             │
│                                     │
│  Arrives on November 25, 2025       │
│          at 9:00 AM                 │
│                                     │
│   ┌───────────────────────────┐    │
│   │      Send Echo            │    │
│   └───────────────────────────┘    │
│                                     │
└─────────────────────────────────────┘
```

**Visual Feedback:**
- Character counter turns **Orange** (`#FF9500`) at 251 chars
- Border of text field remains normal (no red border)
- User can still type up to 280 (hard limit enforced by iOS)

---

## 3. Revelation Screen

### 3.1 Full Layout (Achievement Emotion)

```
┌─────────────────────────────────────┐
│                                     │ ← No navigation bar (modal)
│                                     │   Swipe down to dismiss
│     ╔═══════════════════════════╗  │
│     ║                           ║  │
│     ║  An Echo from             ║  │ ← Header (Subheadline, gray)
│     ║  November 18, 2025        ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │ ← Divider
│     ║                           ║  │
│     ║  I finished my first      ║  │ ← Original Vibe (Title 2, bold)
│     ║  marathon today! Feeling  ║  │   Primary Text color
│     ║  proud and exhausted.     ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │
│     ║                           ║  │
│     ║  Remember the strength    ║  │ ← Smart Recommendation
│     ║  it took to achieve       ║  │   (Callout, Secondary Text)
│     ║  marathon.                ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │
│     ║                           ║  │
│     ║  "The impediment to       ║  │ ← Quote (Body Italic)
│     ║  action advances action.  ║  │   Tertiary Text
│     ║  What stands in the way   ║  │
│     ║  becomes the way."        ║  │
│     ║                           ║  │
│     ║      — Marcus Aurelius    ║  │ ← Attribution (Footnote)
│     ║                           ║  │
│     ║                           ║  │
│     ║  ┌──────────┐ ┌─────────┐║  │
│     ║  │ Reflect  │ │ Dismiss │║  │ ← Action buttons
│     ║  └──────────┘ └─────────┘║  │   (Secondary style, side by side)
│     ║                           ║  │
│     ╚═══════════════════════════╝  │
│                                     │
│                                     │
│     🎉 (Confetti animation)         │ ← Optional: Achievement only
│                                     │   Fades out after 1.5s
│                                     │
└─────────────────────────────────────┘
```

**Card Specifications:**
- Background: Primary Background (white/black)
- Corner radius: 20pt
- Shadow: y-offset 8pt, blur 24pt, opacity 0.12
- Padding: 24pt
- Width: Screen width - 40pt (20pt margins)
- Vertical position: Centered

**Dismissal Gesture:**
- Swipe down anywhere on card → Dismiss modal
- Alternative: Tap "Dismiss" button

---

### 3.2 Comfort Emotion Example

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│     ╔═══════════════════════════╗  │
│     ║                           ║  │
│     ║  An Echo from             ║  │
│     ║  November 15, 2025        ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │
│     ║                           ║  │
│     ║  I'm nervous about the    ║  │ ← Original Vibe
│     ║  presentation tomorrow.   ║  │   (Comfort emotion)
│     ║  But I've prepared well.  ║  │
│     ║  Trust yourself.          ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │
│     ║                           ║  │
│     ║  You've prepared for      ║  │ ← Smart Recommendation
│     ║  this presentation.       ║  │   (Comfort template)
│     ║  Trust yourself.          ║  │
│     ║                           ║  │
│     ║ ─────────────────────────  ║  │
│     ║                           ║  │
│     ║  "Anxiety is not a        ║  │ ← Quote (Mindfulness category)
│     ║  prediction. You are      ║  │
│     ║  capable."                ║  │
│     ║                           ║  │
│     ║      — Unknown            ║  │
│     ║                           ║  │
│     ║                           ║  │
│     ║  ┌──────────┐ ┌─────────┐║  │
│     ║  │ Reflect  │ │ Dismiss │║  │
│     ║  └──────────┘ └─────────┘║  │
│     ║                           ║  │
│     ╚═══════════════════════════╝  │
│                                     │
│                                     │
│     (No confetti for Comfort)       │ ← Calm, supportive tone
│                                     │
└─────────────────────────────────────┘
```

**Emotional Tone Differences:**
- Achievement → Celebration (confetti, bright)
- Comfort → Calm (no animation, softer colors)
- Motivation → Energetic (potential flame animation, v2.0)

---

## 4. Settings Screen

### 4.1 Full Layout

```
┌─────────────────────────────────────┐
│  ✕          Settings                │ ← Navigation Bar
│                                     │
├─────────────────────────────────────┤
│                                     │
│  NOTIFICATIONS                      │ ← Section Header (Footnote, Gray)
│                                     │
│  ┌───────────────────────────────┐ │
│  │ Enable Notifications     [ON] │ │ ← Toggle switch
│  └───────────────────────────────┘ │   (iOS standard)
│                                     │
│  ABOUT                              │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ What is Echo?              › │ │ ← Tap to expand modal
│  ├───────────────────────────────┤ │   with Ebbinghaus explainer
│  │ Version 1.0 (Build 1)         │ │
│  └───────────────────────────────┘ │
│                                     │
│  SCHEDULED ECHOES                   │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ Manage Scheduled Echoes    › │ │ ← Tap to open list view
│  └───────────────────────────────┘ │
│                                     │
│  LEGAL                              │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ Privacy Policy             › │ │
│  ├───────────────────────────────┤ │
│  │ Terms of Service           › │ │
│  └───────────────────────────────┘ │
│                                     │
│  SUPPORT                            │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ Send Feedback              › │ │ ← Opens email or form
│  ├───────────────────────────────┤ │
│  │ Rate Echo                  › │ │ ← Opens App Store rating
│  └───────────────────────────────┘ │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**List Style:** iOS standard `List` / `Form` style
- Group background: Secondary Background
- Dividers: 1pt, Divider color
- Chevron (›): System accent blue

---

### 4.2 Manage Scheduled Echoes (Detail View)

```
┌─────────────────────────────────────┐
│  ‹ Settings  Scheduled Echoes       │ ← Back button + title
│                                     │
├─────────────────────────────────────┤
│                                     │
│  3 Echoes scheduled                 │ ← Summary (Callout, gray)
│                                     │
│  ┌───────────────────────────────┐ │
│  │ 🏆 I finished my first...     │ │ ← Vibe preview (first 30 chars)
│  │    Arrives: Nov 25, 9:00 AM   │ │   Emotion icon + date
│  │                          [✕]  │ │   [✕] = Delete button
│  ├───────────────────────────────┤ │
│  │ 💙 I'm nervous about the...   │ │
│  │    Arrives: Nov 21, 9:00 AM   │ │
│  │                          [✕]  │ │
│  ├───────────────────────────────┤ │
│  │ ⚡ Starting new job Monday    │ │
│  │    Arrives: Nov 19, 9:00 AM   │ │
│  │                          [✕]  │ │
│  └───────────────────────────────┘ │
│                                     │
│  Tap ✕ to cancel an Echo            │ ← Help text (Footnote)
│                                     │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Interaction:**
- Tap [✕] → Confirmation alert: "Cancel this Echo?"
  - "Cancel Echo" (destructive action)
  - "Nevermind"
- Swipe left on row → Reveal delete button (iOS standard)

---

## 5. Component Annotations

### 5.1 Emotion Chip Detailed Specs

**Unselected State:**
```
┌──────────────────┐
│  🏆 Achievement  │  ← Icon (24pt) + Label (Callout, 16pt)
└──────────────────┘
      ↑
Background: Emotion color (#FFD60A) at 20% opacity
Border: None
Corner Radius: 20pt (pill shape)
Padding: 8pt vertical, 16pt horizontal
```

**Selected State:**
```
┌──────────────────┐
│  🏆 Achievement  │
└──────────────────┘
      ↑
Background: Emotion color at 30% opacity (brighter)
Border: 2pt solid Emotion color (#FFD60A)
Corner Radius: 20pt
Padding: 8pt vertical, 16pt horizontal (minus 2pt for border)
```

**Pressed State (During Tap):**
- Scale: 0.95 (5% shrink)
- Duration: 0.15s

---

### 5.2 Interval Segmented Control

**iOS Native Component:** UISegmentedControl (SwiftUI `Picker` with `.segmented` style)

```
┌─────┬─────┬─────┬─────┬─────┐
│ 1d  │ 3d  │ 7d  │ 30d │ 90d │
└─────┴─────┴─────┴─────┴─────┘
   ↑
Height: 32pt
Font: Body (17pt), adjusted to fit
Selected: Accent Blue background, white text
Unselected: Transparent, Primary Text
```

**Alternative Design (If Segmented Control Feels Cramped):**

Vertical Radio Button List:

```
○ 1 day (Tomorrow at 9:00 AM)
○ 3 days (November 21 at 9:00 AM)
● 7 days (November 25 at 9:00 AM)  ← Selected (filled circle)
○ 30 days (December 18 at 9:00 AM)
○ 90 days (February 16, 2026 at 9:00 AM)
```

**Pros of Vertical List:**
- Shows full date preview inline
- Easier to tap (larger targets)
- Better for accessibility (Dynamic Type)

**Cons:**
- Takes more vertical space

**Decision:** TBD during usability testing (SRS Appendix D, Item 1)

---

### 5.3 Delivery Date Preview

**Format Options:**

**Option 1 (Concise):**
```
Arrives on November 25, 2025 at 9:00 AM
```

**Option 2 (Relative + Absolute):**
```
Arrives in 7 days
November 25, 2025 at 9:00 AM
```

**Option 3 (Super Concise):**
```
Nov 25, 2025 • 9:00 AM
```

**Recommendation:** Option 1 (clear, unambiguous)
- Font: Callout (16pt), Semibold
- Color: Accent Blue (highlights importance)

---

### 5.4 Confirmation Toast (After Sending Echo)

**Layout:**

```
     ┌─────────────────────────────┐
     │  ✓  Echo scheduled!         │  ← Checkmark icon + message
     │     See you in 7 days.      │     (Body font)
     └─────────────────────────────┘
              ↑
    Background: Success Green (#34C759)
    Text: White
    Corner Radius: 12pt
    Padding: 16pt
    Shadow: y-offset 4pt, blur 12pt, opacity 0.3
```

**Animation:**
- Appear: Slide from bottom (0.3s) + fade in
- Duration visible: 2 seconds
- Disappear: Fade out (0.3s)

**Position:** 60pt from bottom of screen (above home indicator)

---

## 6. Onboarding Flow (Optional, v1.1)

**Note:** MVP does not include onboarding screens. Users start directly on Home Screen.

**Future Consideration:**
1. Welcome screen: "Welcome to Echo"
2. Explanation: Ebbinghaus Forgetting Curve (with diagram)
3. Notification permission request (with explanation of why it's critical)
4. First Vibe creation tutorial

**Rationale for Skipping in MVP:**
- App should be self-explanatory (SRS BR-001: Minimalism)
- Notification permission requested on first Echo send (contextual)
- "What is Echo?" explainer available in Settings

---

## 7. Empty States

### 7.1 Home Screen (No Echoes)

Already shown in Section 1.1

**Message:** "No Echoes scheduled"

---

### 7.2 Settings → Manage Scheduled Echoes (Empty)

```
┌─────────────────────────────────────┐
│  ‹ Settings  Scheduled Echoes       │
│                                     │
├─────────────────────────────────────┤
│                                     │
│                                     │
│                                     │
│         📭                          │ ← Empty state icon (48pt)
│                                     │
│    No Echoes scheduled              │ ← Title (Title 3)
│                                     │
│  Send your first Echo to see        │ ← Description (Callout, gray)
│  it appear here.                    │
│                                     │
│                                     │
│   ┌───────────────────────────┐    │
│   │    Send an Echo           │    │ ← CTA button
│   └───────────────────────────┘    │
│                                     │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Interaction:** Tap CTA → Navigate to Vibe Composer

---

## 8. Error States

### 8.1 Revelation Screen (Failed to Load Vibe)

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│     ╔═══════════════════════════╗  │
│     ║                           ║  │
│     ║        ⚠️                  ║  │ ← Warning icon (48pt, orange)
│     ║                           ║  │
│     ║  Echo could not be        ║  │ ← Title (Title 2)
│     ║  loaded                   ║  │
│     ║                           ║  │
│     ║  This Echo may have been  ║  │ ← Description (Callout)
│     ║  corrupted. Please try    ║  │
│     ║  again later.             ║  │
│     ║                           ║  │
│     ║                           ║  │
│     ║  ┌───────────────────────┐║  │
│     ║  │      Dismiss          │║  │
│     ║  └───────────────────────┘║  │
│     ║                           ║  │
│     ╚═══════════════════════════╝  │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

**Trigger:** Vibe ID from notification payload not found in database

---

### 8.2 Notification Permission Denied (Banner)

**If user denies notification permission, show in-app banner on Home Screen:**

```
┌─────────────────────────────────────┐
│  ☰                          ⚙︎      │
│                                     │
├─────────────────────────────────────┤
│  ┌───────────────────────────────┐ │
│  │ ⚠️ Notifications Disabled     │ │ ← Warning banner
│  │                               │ │   (Warning color background)
│  │ Echoes won't arrive without   │ │
│  │ notifications. Enable in      │ │
│  │ Settings.                     │ │
│  │                               │ │
│  │         [Enable] [Dismiss]    │ │ ← Action buttons
│  └───────────────────────────────┘ │
│                                     │
│            Echo                     │
│                                     │
│ ... (rest of Home Screen)           │
│                                     │
└─────────────────────────────────────┘
```

**Actions:**
- "Enable" → Open iOS Settings app (deep link: `App-Prefs:root=NOTIFICATIONS_ID&path=com.yourcompany.Echo`)
- "Dismiss" → Hide banner (re-show after 7 days, per SRS FR-002)

---

## 9. Accessibility Considerations

### 9.1 VoiceOver Reading Order

**Home Screen:**
1. Settings button
2. Logo "Echo"
3. Tagline
4. "Send an Echo" button
5. Upcoming Echoes card (if visible)

**Vibe Composer:**
1. Close button
2. Text field (with character count announced: "245 characters of 280")
3. Emotion selector label
4. Emotion chips (horizontal scroll, each chip announced)
5. Interval selector label
6. Interval options
7. Delivery preview
8. "Send Echo" button (state announced: "disabled" or "enabled")

**Revelation Screen:**
1. Header "An Echo from [date]"
2. Vibe text
3. Smart recommendation
4. Quote text
5. Quote attribution
6. "Reflect" button
7. "Dismiss" button

---

### 9.2 Dynamic Type Testing

**All wireframes must be tested at:**
- **Default size** (what's shown above)
- **Accessibility XXL:** Text scales ~310%

**Expected changes at XXL:**
- Multi-line text fields expand vertically
- Emotion chips may stack vertically (if horizontal scroll becomes unreadable)
- Buttons expand vertically to fit text
- Revelation card content scrolls if exceeds screen height

---

## 10. Responsive Design (Future: iPad)

**Note:** MVP is iPhone-only (SRS 5.4: Portability)

**Future Consideration (v2.0):**
- iPad layout: Side-by-side composer + preview
- Larger text fields (take advantage of screen space)
- Grid view for Scheduled Echoes

---

*[End of Wireframes]*

**Document Status:** Complete
**Next Steps:** Create user flow diagrams showing navigation between screens
