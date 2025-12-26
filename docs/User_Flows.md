# Echo_app User Flows
**Version:** 1.0
**Date:** 2025-11-18
**Project:** Echo_app
**Purpose:** Navigation and interaction flow diagrams

---

## Table of Contents

1. **Flow 1: First Launch & Notification Permission**
2. **Flow 2: Creating a Vibe (Happy Path)**
3. **Flow 3: Notification Delivery → Revelation**
4. **Flow 4: Managing Scheduled Echoes**
5. **Flow 5: Error Handling Flows**

---

## 1. Flow 1: First Launch & Notification Permission

### 1.1 First Launch (No Onboarding in MVP)

```
[App Icon Tap]
      ↓
┌─────────────────┐
│  App Launches   │
└─────────────────┘
      ↓
┌─────────────────┐
│  Home Screen    │ ← No onboarding (minimalist principle)
│  (Empty State)  │   User sees: Logo + "Send an Echo" CTA
└─────────────────┘
      ↓
[User Taps "Send an Echo"]
      ↓
┌─────────────────┐
│ Vibe Composer   │
│ Screen          │
└─────────────────┘
      ↓
[User Fills Vibe]
      ↓
[User Taps "Send Echo"]
      ↓
┌─────────────────────────┐
│ System Checks:          │
│ Notification Permission │
└─────────────────────────┘
      ↓
  ┌───┴───┐
  │ Has?  │
  └───┬───┘
      │
   ┌──┴──┐
   │ NO  │
   └──┬──┘
      ↓
┌──────────────────────────┐
│ iOS System Alert:        │
│ "Echo would like to send │
│  you notifications"      │
│  [Don't Allow] [Allow]   │
└──────────────────────────┘
      ↓
   ┌──┴──┐
   │User │
   │Pick?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
[Allow]        [Don't Allow]
   │               │
   ↓               ↓
Save Vibe    Save Vibe (but show warning banner)
Schedule     No notification scheduled
Notification
   │               │
   └───────┬───────┘
           ↓
┌─────────────────┐
│ Confirmation    │
│ Toast:          │
│ "Echo scheduled │
│  for [date]"    │
└─────────────────┘
           ↓
┌─────────────────┐
│ Home Screen     │ ← Now shows "1 Echo scheduled"
└─────────────────┘
```

**Key Decision Point:**
- If user denies notification → Vibe still saves, but no notification fires
- Warning banner appears on Home Screen (see Wireframes Section 8.2)

---

## 2. Flow 2: Creating a Vibe (Happy Path)

### 2.1 Complete Vibe Creation Flow

```
[Home Screen]
      ↓
[Tap "Send an Echo" Button]
      ↓
┌──────────────────────────┐
│ Vibe Composer Screen     │ ← Initial state:
│                          │   - Empty text field
│ - Text Field (empty)     │   - No emotion selected
│ - Emotion Selector       │   - No interval selected
│ - Interval Picker        │   - "Send Echo" button DISABLED
│ - Preview (placeholder)  │
│ - [Send Echo] DISABLED   │
└──────────────────────────┘
      ↓
[User Types Text]
      ↓
┌──────────────────────────┐
│ Real-time Updates:       │
│ - Character counter      │ ← "12/280" updates as user types
│   updates                │
│ - Send button still      │
│   disabled (no emotion)  │
└──────────────────────────┘
      ↓
[User Selects Emotion: "Achievement"]
      ↓
┌──────────────────────────┐
│ Visual Feedback:         │
│ - Chip border appears    │ ← Achievement chip highlights
│ - Background brightens   │   Gold border + 30% opacity background
│ - Send button still      │
│   disabled (no interval) │
└──────────────────────────┘
      ↓
[User Selects Interval: "7d"]
      ↓
┌──────────────────────────┐
│ Calculation:             │
│ Current: Nov 18, 2025    │
│ + 7 days                 │
│ = Nov 25, 2025 at 9:00AM │
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ Preview Updates:         │
│ "Arrives on November 25, │ ← Bold, blue text
│  2025 at 9:00 AM"        │
│                          │
│ Send button ENABLED      │ ← All 3 fields filled
└──────────────────────────┘
      ↓
[User Taps "Send Echo"]
      ↓
┌──────────────────────────┐
│ System Processing:       │
│ 1. Generate Vibe ID      │
│ 2. Save to SwiftData     │
│ 3. Schedule Notification │
│ 4. Dismiss Composer      │
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ Confirmation Toast       │
│ Appears (2 seconds):     │
│ "✓ Echo scheduled!       │
│  See you in 7 days."     │
└──────────────────────────┘
      ↓
[Animation: Slide from bottom, fade in]
      ↓
[Wait 2 seconds]
      ↓
[Animation: Fade out]
      ↓
┌──────────────────────────┐
│ Home Screen              │ ← Updated state:
│                          │   "1 Echo scheduled"
│ ┌──────────────────────┐ │   Upcoming Echoes card visible
│ │ 📆 1 Echo Scheduled  │ │
│ │ • Nov 25 (7 days)    │ │
│ └──────────────────────┘ │
└──────────────────────────┘
```

**Validation Rules (Enforced Throughout):**
- Text: 1-280 characters (hard limit at 280)
- Emotion: Exactly 1 required
- Interval: Exactly 1 required
- All 3 → "Send Echo" button enables

---

## 3. Flow 3: Notification Delivery → Revelation

### 3.1 Notification Fires (7 Days Later)

```
[November 25, 2025 at 9:00 AM]
      ↓
┌──────────────────────────┐
│ iOS System Fires         │
│ Local Notification       │
│                          │
│ Title: "An Echo has      │
│        arrived"          │
│ Body: "I finished my     │
│       first marathon..." │
│ Sound: Default           │
│ Badge: 1                 │
└──────────────────────────┘
      ↓
┌───────────────────────────────┐
│ Notification appears in:      │
│ - Lock Screen (if locked)     │
│ - Notification Center         │
│ - Banner (if app not active)  │
└───────────────────────────────┘
      ↓
   ┌──┴──┐
   │User │
   │Taps?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
  YES             NO
   │               │
   ↓               ↓
[Tap]       [Ignore]
   │               │
   │               └─→ [Notification stays in Center]
   │                   [Badge remains on app icon]
   │                   [User can tap later]
   ↓
┌──────────────────────────┐
│ App Launches             │ ← If app was closed
│ (or comes to foreground) │   If already open
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ System Processing:       │
│ 1. Read userInfo from    │
│    notification payload  │
│ 2. Extract vibeID        │
│ 3. Query SwiftData for   │
│    Vibe by ID            │
└──────────────────────────┘
      ↓
   ┌──┴──┐
   │Found?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
  YES             NO
   │               │
   ↓               ↓
┌──────────────┐  ┌──────────────┐
│ Load Vibe    │  │ Show Error   │
│ Data:        │  │ State:       │
│ - Text       │  │ "Echo could  │
│ - Emotion    │  │  not be      │
│ - Date       │  │  loaded"     │
└──────────────┘  └──────────────┘
      ↓                  │
┌──────────────────┐     │
│ Generate:        │     │
│ 1. Smart Rec     │     │
│ 2. Matched Quote │     │
└──────────────────┘     │
      ↓                  │
      └────────┬─────────┘
               ↓
┌──────────────────────────┐
│ Present Revelation       │
│ Screen (Modal):          │
│                          │
│ - Slide up animation     │
│ - Backdrop fade in       │
│ - Confetti (Achievement) │
└──────────────────────────┘
      ↓
[User Reads Content]
      ↓
   ┌──┴──┐
   │User │
   │Pick?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
[Reflect]      [Dismiss]
   │               │
   ↓               ↓
┌──────────┐  ┌──────────┐
│ Optional │  │ Dismiss  │
│ Future:  │  │ Modal    │
│ Journal  │  │          │
│ Entry    │  │ (Swipe   │
│          │  │  down or │
│ (v1.1)   │  │  tap)    │
└──────────┘  └──────────┘
   │               │
   └───────┬───────┘
           ↓
┌──────────────────────────┐
│ Update Database:         │
│ - Mark Vibe as delivered │
│ - Clear badge count      │
└──────────────────────────┘
           ↓
┌──────────────────────────┐
│ Home Screen              │ ← User returns
└──────────────────────────┘
```

**Timing:**
- Notification fires at **exactly 9:00 AM** local time
- User can tap immediately or hours later (notification persists)

---

## 4. Flow 4: Managing Scheduled Echoes

### 4.1 Viewing and Cancelling Echoes

```
[Home Screen]
      ↓
[Tap "3 Echoes scheduled" Card]
  OR
[Tap Settings → "Manage Scheduled Echoes"]
      ↓
┌──────────────────────────┐
│ Scheduled Echoes List    │
│                          │
│ 1. Marathon (Nov 25)     │
│ 2. Presentation (Nov 21) │
│ 3. New job (Nov 19)      │
└──────────────────────────┘
      ↓
[User Swipes Left on Row 2]
      ↓
┌──────────────────────────┐
│ Delete Button Reveals    │ ← iOS standard swipe-to-delete
│ [Delete]                 │
└──────────────────────────┘
      ↓
[User Taps "Delete"]
      ↓
┌──────────────────────────┐
│ Confirmation Alert:      │
│ "Cancel this Echo?"      │
│                          │
│ "You won't receive this  │
│  message on Nov 21."     │
│                          │
│ [Cancel Echo] [Nevermind]│
└──────────────────────────┘
      ↓
   ┌──┴──┐
   │User │
   │Pick?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
[Cancel Echo]  [Nevermind]
   │               │
   ↓               ↓
┌──────────┐  ┌──────────┐
│ Delete:  │  │ Dismiss  │
│ 1. Vibe  │  │ Alert    │
│ 2. Notif │  │          │
└──────────┘  │ (No      │
   │          │  change) │
   │          └──────────┘
   ↓               │
┌──────────────┐  │
│ Row animates │  │
│ out (fade +  │  │
│  slide)      │  │
└──────────────┘  │
   │              │
   └──────┬───────┘
          ↓
┌──────────────────────────┐
│ Updated List:            │
│ 1. Marathon (Nov 25)     │ ← Row 2 removed
│ 2. New job (Nov 19)      │
└──────────────────────────┘
          ↓
[User Taps Back]
          ↓
┌──────────────────────────┐
│ Home Screen              │ ← Counter updates:
│ "2 Echoes scheduled"     │   "3" → "2"
└──────────────────────────┘
```

**Alternative Interaction:**
- Instead of swipe, user can tap [✕] button on each row (see Wireframes 4.2)

---

## 5. Flow 5: Error Handling Flows

### 5.1 Character Limit Exceeded (Edge Case)

```
[Vibe Composer]
      ↓
[User Types 280 Characters]
      ↓
┌──────────────────────────┐
│ Character Counter:       │
│ "280/280" (Orange)       │ ← Warning color
└──────────────────────────┘
      ↓
[User Tries to Type More]
      ↓
┌──────────────────────────┐
│ iOS Text Field           │
│ Hard Limit Enforced:     │
│ - Keyboard input blocked │ ← No additional chars accepted
│ - Haptic feedback (buzz) │   System handles this automatically
└──────────────────────────┘
      ↓
[User Can Still Send or Edit]
```

**Implementation:** SwiftUI `TextField` with `.lineLimit(280)` modifier

---

### 5.2 Notification Permission Denied (Later)

```
[User Denies Notification on First Vibe]
      ↓
┌──────────────────────────┐
│ Vibe Still Saves         │ ← Data persists locally
│ But No Notification      │   Notification not scheduled
│ Scheduled                │
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ Home Screen Shows        │
│ Warning Banner:          │
│ "⚠️ Notifications        │
│  Disabled. Enable in     │
│  Settings."              │
│ [Enable] [Dismiss]       │
└──────────────────────────┘
      ↓
   ┌──┴──┐
   │User │
   │Pick?│
   └──┬──┘
      │
   ┌──┴────────────┐
   │               │
[Enable]       [Dismiss]
   │               │
   ↓               ↓
┌──────────┐  ┌──────────┐
│ Open iOS │  │ Hide     │
│ Settings │  │ Banner   │
│ App      │  │          │
│ (Deep    │  │ (Re-show │
│  Link)   │  │  in 7d)  │
└──────────┘  └──────────┘
   │
   └─→ [User manually enables in iOS Settings → Notifications]
         ↓
      [Returns to App]
         ↓
┌──────────────────────────┐
│ Banner disappears        │
│ Future Vibes will now    │
│ schedule notifications   │
└──────────────────────────┘
```

---

### 5.3 Corrupted Vibe Data (Revelation Fails)

```
[Notification Fires]
      ↓
[User Taps Notification]
      ↓
┌──────────────────────────┐
│ App Queries Database:    │
│ SELECT * FROM Vibe       │
│ WHERE id = [vibeID]      │
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ Result: NULL             │ ← Vibe not found (deleted/corrupted)
└──────────────────────────┘
      ↓
┌──────────────────────────┐
│ Show Error State:        │
│                          │
│ ⚠️ "Echo could not be    │
│    loaded"               │
│                          │
│ "This Echo may have been │
│  corrupted. Please try   │
│  again later."           │
│                          │
│ [Dismiss]                │
└──────────────────────────┘
      ↓
[User Taps Dismiss]
      ↓
┌──────────────────────────┐
│ Home Screen              │
└──────────────────────────┘
```

**Mitigation:**
- SwiftData auto-saves reduce corruption risk
- iOS device backups preserve data

---

## 6. Navigation Map (All Screens)

### 6.1 Complete App Navigation Structure

```
                    ┌─────────────┐
                    │ Home Screen │ ← Entry point
                    └──────┬──────┘
                           │
             ┌─────────────┼─────────────┐
             │             │             │
             ↓             ↓             ↓
    ┌────────────┐  ┌──────────┐  ┌──────────┐
    │  Vibe      │  │ Settings │  │Revelation│ ← Modal (from notification)
    │  Composer  │  │          │  │  Screen  │
    └────────────┘  └────┬─────┘  └──────────┘
         │               │
         │               ↓
         │      ┌────────────────┐
         │      │ Manage Echoes  │
         │      └────────────────┘
         │               │
         │               ↓
         │      ┌────────────────┐
         │      │ Privacy Policy │
         │      └────────────────┘
         │
         └──→ [After Send] ──→ Home Screen
```

**Modal Presentations:**
- Revelation Screen: Presented modally (not pushed)
- Privacy Policy: Presented modally (Safari View Controller)

**Standard Push Navigation:**
- Settings → Manage Echoes (push)
- All other navigations use standard navigation stack

---

## 7. Interaction Patterns Summary

### 7.1 Common Gestures

| Action | Gesture | Screen | Result |
|--------|---------|--------|--------|
| Open Composer | Tap "Send an Echo" button | Home | Navigate to Composer |
| Close Composer | Tap ✕ (top-left) | Composer | Dismiss, discard unsaved Vibe |
| Select Emotion | Tap emotion chip | Composer | Highlight chip, enable validation |
| Select Interval | Tap segment | Composer | Update preview date |
| Send Vibe | Tap "Send Echo" button | Composer | Save, schedule, show toast |
| Dismiss Revelation | Swipe down on card | Revelation | Dismiss modal |
| Delete Echo | Swipe left on row | Manage Echoes | Reveal delete button |
| Open Settings | Tap ⚙︎ icon | Home or Composer | Navigate to Settings |

### 7.2 Animation Timing Reference

| Transition | Duration | Curve | Notes |
|------------|----------|-------|-------|
| Screen push/pop | 0.35s | `easeInOut` | iOS standard |
| Modal present | 0.4s | `spring` | Bottom-to-top |
| Button press | 0.15s | `easeOut` | Scale 0.95 |
| Toast appear | 0.3s | `easeOut` | Slide + fade |
| Toast disappear | 0.3s | `easeIn` | Fade out |
| Confetti | 1.5s | N/A | Particle system |

---

## 8. State Management

### 8.1 Vibe Composer States

| State | Text | Emotion | Interval | Send Button |
|-------|------|---------|----------|-------------|
| **Initial** | Empty | None | None | Disabled (gray) |
| **Typing** | 1-280 | None | None | Disabled |
| **Emotion Selected** | 1-280 | Selected | None | Disabled |
| **Interval Selected** | 1-280 | None | Selected | Disabled |
| **Ready** | 1-280 | Selected | Selected | **Enabled (blue)** |
| **Character Warning** | 251-280 | Selected | Selected | Enabled (counter orange) |

### 8.2 Home Screen States

| State | CTA Button | Upcoming Card | Empty Text |
|-------|------------|---------------|------------|
| **No Echoes** | Visible | Hidden | "No Echoes scheduled" |
| **1-3 Echoes** | Visible | Visible (compact) | Hidden |
| **4+ Echoes** | Visible | Visible (shows 3) | Hidden |
| **Notifications Denied** | Visible | Visible | + Warning banner |

---

*[End of User Flows]*

**Document Status:** Complete
**Next Steps:** Document interaction patterns and create accessibility specifications
