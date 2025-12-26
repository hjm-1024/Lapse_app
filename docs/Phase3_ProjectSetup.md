# Phase 3: Development - Project Setup Guide
**Version:** 1.0
**Date:** 2025-11-18
**Project:** Echo_app
**Status:** In Progress

---

## 1. Xcode Project Creation (Manual Step)

Since this is a code assistant environment, the actual Xcode project must be created manually by the developer. Follow these steps:

### 1.1 Create New Xcode Project

1. Open Xcode 15.0 or later
2. File → New → Project
3. Select **iOS → App**
4. Configure:
   - **Product Name:** Echo
   - **Team:** Your development team
   - **Organization Identifier:** com.yourcompany (replace with your reverse domain)
   - **Bundle Identifier:** com.yourcompany.Echo
   - **Interface:** SwiftUI
   - **Language:** Swift
   - **Storage:** SwiftData
   - **Include Tests:** ✅ Checked
5. Choose save location: `/path/to/Echo_app/`
6. Create Git repository: ✅ Checked

### 1.2 Project Settings

**General Tab:**
- **Deployment Target:** iOS 17.0
- **Supported Destinations:** iPhone (no iPad)
- **Supported Orientations:** Portrait only
- **Status Bar Style:** Default

**Build Settings:**
- **Swift Language Version:** Swift 5.9
- **Optimization Level (Debug):** No Optimization
- **Optimization Level (Release):** Optimize for Speed

**Signing & Capabilities:**
- **Automatically manage signing:** ✅
- **Team:** Your team
- **Add Capability:** Push Notifications (for UserNotifications)

---

## 2. Project Structure

The following directory structure has been created in `/Echo_app/`:

```
Echo_app/
├── Models/
│   ├── Vibe.swift
│   ├── Emotion.swift
│   ├── EbbinghausInterval.swift
│   └── Quote.swift
├── Views/
│   ├── HomeView.swift
│   ├── VibeComposerView.swift
│   ├── RevelationView.swift
│   └── SettingsView.swift
├── ViewModels/
│   ├── HomeViewModel.swift
│   ├── ComposerViewModel.swift
│   └── RevelationViewModel.swift
├── Components/
│   ├── EchoButton.swift
│   ├── EmotionChip.swift
│   └── RevelationCard.swift
├── Services/
│   ├── NotificationService.swift
│   ├── QuoteService.swift
│   └── RecommendationService.swift
├── Resources/
│   ├── quotes.json
│   └── templates.json
├── Utilities/
│   ├── DateCalculator.swift
│   └── KeywordExtractor.swift
└── EchoApp.swift (main app entry point)
```

---

## 3. SwiftData Configuration

### 3.1 Model Container Setup

In `EchoApp.swift` (main app file):

```swift
import SwiftUI
import SwiftData

@main
struct EchoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Vibe.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
```

---

## 4. Info.plist Configuration

Add the following keys to `Info.plist`:

```xml
<key>NSUserNotificationsUsageDescription</key>
<string>Echo needs notifications to deliver your Echoes at the scheduled time.</string>

<key>UILaunchScreen</key>
<dict>
    <key>UIColorName</key>
    <string>LaunchScreenBackground</string>
</dict>

<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
</array>
```

---

## 5. Asset Catalog Configuration

### 5.1 Colors (Assets.xcassets/Colors/)

Create the following color sets in Xcode's Asset Catalog:

**Base Colors:**
- PrimaryBackground (Light: #FFFFFF, Dark: #000000)
- SecondaryBackground (Light: #F5F5F7, Dark: #1C1C1E)
- PrimaryText (Light: #1D1D1F, Dark: #FFFFFF)
- SecondaryText (Light: #6E6E73, Dark: #AEAEB2)
- TertiaryText (Light: #86868B, Dark: #8E8E93)
- AccentBlue (Light: #007AFF, Dark: #0A84FF)
- SuccessGreen (Light: #34C759, Dark: #30D158)
- WarningOrange (Light: #FF9500, Dark: #FF9F0A)

**Emotion Colors:**
- AchievementGold (#FFD60A)
- ComfortSkyBlue (#64D2FF)
- MotivationRed (#FF453A)
- GratitudePurple (#BF5AF2)
- StruggleBrown (#AC8E68)
- JoyOrange (#FF9F0A)
- ReflectionIndigo (#5E5CE6)
- HopeGreen (#32D74B)

### 5.2 App Icon

**Required Sizes:**
- 1024×1024pt (App Store)
- 60×60pt @2x, @3x (iPhone)
- 40×40pt @2x, @3x (Spotlight)
- 20×20pt @2x, @3x (Settings)

**Design:** Minimalist icon representing "echo" or "time capsule" (TBD)

---

## 6. Dependencies

**Zero External Dependencies (Per SRS 5.3: SEC-003)**

No CocoaPods, Swift Package Manager, or Carthage dependencies. Pure SwiftUI/SwiftData stack.

---

## 7. Build Phases

### 7.1 Compile Sources

All `.swift` files in the project directory.

### 7.2 Copy Bundle Resources

- `quotes.json`
- `templates.json`
- `Assets.xcassets`

---

## 8. Testing Configuration

### 8.1 Unit Tests Target

- **Name:** EchoTests
- **Host Application:** Echo
- **Test Files:**
  - VibeModelTests.swift
  - DateCalculatorTests.swift
  - RecommendationServiceTests.swift
  - QuoteServiceTests.swift

### 8.2 UI Tests Target

- **Name:** EchoUITests
- **Test Files:**
  - HomeViewUITests.swift
  - VibeComposerUITests.swift
  - RevelationViewUITests.swift

---

## 9. Git Configuration

### 9.1 .gitignore

Create `.gitignore` in project root:

```
# Xcode
*.xcodeproj/*
!*.xcodeproj/project.pbxproj
!*.xcodeproj/xcshareddata/
!*.xcworkspace/contents.xcworkspacedata
*.xcworkspace/*
!*.xcworkspace/contents.xcworkspacedata
/*.gcno
**/xcshareddata/WorkspaceSettings.xcsettings

# Swift Package Manager
.build/
Packages/
Package.pins
Package.resolved
*.xcodeproj

# CocoaPods (not used, but good practice)
Pods/

# Carthage (not used, but good practice)
Carthage/Build/

# Build artifacts
DerivedData/
build/

# macOS
.DS_Store

# User-specific files
*.swp
*.swo
*~.nib
*.perspectivev3
*.pbxuser
*.mode1v3
*.mode2v3

# Playground
*.playground
