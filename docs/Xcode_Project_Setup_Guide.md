# Echo App - Xcode 프로젝트 설정 완벽 가이드

**버전:** 1.0.0
**작성일:** 2025-11-18
**대상:** 코드 초보자를 위한 단계별 가이드

---

## 📋 목차

1. [사전 준비](#1-사전-준비)
2. [새 Xcode 프로젝트 생성](#2-새-xcode-프로젝트-생성)
3. [파일 구조 설정](#3-파일-구조-설정)
4. [소스 코드 복사](#4-소스-코드-복사)
5. [프로젝트 설정](#5-프로젝트-설정)
6. [빌드 및 실행](#6-빌드-및-실행)
7. [문제 해결](#7-문제-해결)

---

## 1. 사전 준비

### 필요한 것들:
- **Mac 컴퓨터** (macOS Sonoma 이상 권장)
- **Xcode 15.0 이상** (App Store에서 무료 다운로드)
- **이 저장소의 Echo_app 폴더** (모든 소스 코드 포함)

### Xcode 설치 확인:
1. Spotlight 검색 (⌘ + Space)
2. "Xcode" 입력 후 실행
3. 버전 확인: Xcode → About Xcode

---

## 2. 새 Xcode 프로젝트 생성

### Step 1: Xcode 실행
1. Xcode를 실행합니다
2. "Create New Project" 클릭

### Step 2: 템플릿 선택
1. **iOS** 탭 선택
2. **App** 템플릿 선택
3. **Next** 클릭

### Step 3: 프로젝트 정보 입력
| 항목 | 입력 값 |
|------|---------|
| **Product Name** | `Echo` |
| **Team** | 본인의 Apple ID 선택 (없으면 "Add Account"로 추가) |
| **Organization Identifier** | `com.yourname` (본인 이름으로 변경) |
| **Bundle Identifier** | 자동 생성됨 (예: `com.yourname.Echo`) |
| **Interface** | **SwiftUI** 선택 ⚠️ 중요! |
| **Language** | **Swift** 선택 |
| **Storage** | **SwiftData** 선택 ⚠️ 중요! |
| **Include Tests** | 체크 해제 (불필요) |

4. **Next** 클릭
5. 저장 위치 선택 (예: Documents 폴더)
6. **Create** 클릭

---

## 3. 파일 구조 설정

### Step 1: 기본 파일 삭제
Xcode가 자동으로 생성한 파일들을 먼저 삭제합니다:

1. **좌측 Project Navigator에서 다음 파일들을 선택**:
   - `ContentView.swift`
   - `Item.swift` (SwiftData 선택 시 생성됨)

2. **Delete 키 누르기**
3. 팝업에서 **"Move to Trash"** 선택

### Step 2: 폴더 구조 생성
Project Navigator에서 `Echo` 폴더를 **우클릭** → **New Group**:

다음 그룹들을 생성하세요:
```
Echo/
├── Models/
├── Views/
├── Services/
└── Resources/
```

**그룹 생성 순서:**
1. `Echo` 폴더 우클릭 → New Group → 이름을 `Models`로 변경
2. `Echo` 폴더 우클릭 → New Group → 이름을 `Views`로 변경
3. `Echo` 폴더 우클릭 → New Group → 이름을 `Services`로 변경
4. `Echo` 폴더 우클릭 → New Group → 이름을 `Resources`로 변경

---

## 4. 소스 코드 복사

### 방법 A: Finder에서 직접 드래그 (권장)

1. **Finder에서 이 저장소의 `Echo_app` 폴더를 엽니다**

2. **Models 폴더 복사:**
   - Finder: `Echo_app/Models/` 안의 모든 `.swift` 파일 선택
   - Xcode의 `Models` 그룹으로 **드래그**
   - 팝업 옵션:
     - ✅ **Copy items if needed** 체크
     - ✅ **Create groups** 선택
     - ✅ **Echo (target)** 체크
   - **Finish** 클릭

3. **Views 폴더 복사:**
   - Finder: `Echo_app/Views/` 안의 모든 `.swift` 파일 선택
   - Xcode의 `Views` 그룹으로 **드래그**
   - 동일한 옵션 선택 → **Finish**

4. **Services 폴더 복사:**
   - Finder: `Echo_app/Services/` 안의 모든 `.swift` 파일 선택
   - Xcode의 `Services` 그룹으로 **드래그**
   - 동일한 옵션 선택 → **Finish**

5. **Resources 폴더 복사:**
   - Finder: `Echo_app/Resources/` 안의 모든 파일 선택:
     - `quotes.json`
     - `templates.json`
     - `Assets.xcassets` (폴더 전체)
   - Xcode의 `Resources` 그룹으로 **드래그**
   - 동일한 옵션 선택 → **Finish**

6. **EchoApp.swift 복사:**
   - Finder: `Echo_app/EchoApp.swift` 파일 선택
   - Xcode의 `Echo` 그룹 (최상위)으로 **드래그**
   - 동일한 옵션 선택 → **Finish**
   - **기존 `EchoApp.swift` 파일을 덮어쓰기 (Replace)** 선택

7. **Info.plist 복사:**
   - Finder: `Echo_app/Info.plist` 파일 선택
   - Xcode의 `Echo` 그룹 (최상위)으로 **드래그**
   - 동일한 옵션 선택 → **Finish**

### 최종 파일 구조 확인:
```
Echo/
├── EchoApp.swift
├── Info.plist
├── Models/
│   ├── Emotion.swift
│   ├── EbbinghausInterval.swift
│   ├── Quote.swift
│   └── Vibe.swift
├── Views/
│   ├── HomeView.swift
│   ├── VibeComposerView.swift
│   ├── RevelationView.swift
│   └── SettingsView.swift
├── Services/
│   ├── NotificationService.swift
│   ├── QuoteService.swift
│   └── RecommendationService.swift
└── Resources/
    ├── quotes.json
    ├── templates.json
    └── Assets.xcassets/
```

---

## 5. 프로젝트 설정

### Step 1: Info.plist 설정

1. **Project Navigator에서 최상위 "Echo" (파란 아이콘) 클릭**
2. **TARGETS** 섹션에서 **Echo** 선택
3. **Info** 탭 선택
4. 하단 **Custom iOS Target Properties** 섹션에서:
   - 우클릭 → **Raw Keys & Values** 선택 (중요!)

5. **우클릭** → **Add Row** 클릭하여 다음 항목 추가:

   | Key | Type | Value |
   |-----|------|-------|
   | `NSUserNotificationsUsageDescription` | String | `Echo needs notification permission to deliver your time-delayed messages at the scheduled time.` |

   > **자동으로 추가되어 있으면 건너뛰세요**

### Step 2: Deployment Target 설정

1. **General** 탭 선택
2. **Minimum Deployments** 섹션에서:
   - **iOS** 버전을 **17.0** 이상으로 설정

### Step 3: Bundle Identifier 확인

1. **General** 탭에서 **Identity** 섹션 확인:
   - **Bundle Identifier**: `com.yourname.Echo` (본인이 설정한 값)
   - **Version**: `1.0.0`
   - **Build**: `1`

### Step 4: App Icons (선택 사항)

1. **Assets.xcassets** 폴더 선택
2. **AppIcon** 클릭
3. 원하는 아이콘 이미지를 드래그 (1024x1024 PNG 권장)
   - 없으면 일단 건너뛰어도 됩니다

---

## 6. 빌드 및 실행

### Step 1: 시뮬레이터 선택

1. Xcode 상단 중앙 **Scheme 선택 버튼** 클릭
2. **iPhone 15 Pro** 또는 **iPhone 15** 선택 (iOS 17.0+ 지원 기기)

### Step 2: 빌드

1. **Product** 메뉴 → **Build** (⌘ + B)
2. 빌드 진행 상황을 상단 중앙에서 확인
3. ✅ **"Build Succeeded"** 메시지 확인

### Step 3: 실행

1. **Product** 메뉴 → **Run** (⌘ + R)
2. 시뮬레이터가 자동으로 실행됩니다
3. 앱이 시뮬레이터에 설치되고 자동 실행됩니다

### Step 4: 앱 테스트

1. **홈 화면 확인**:
   - "Echo" 제목 표시
   - "Create an Echo" 파란 버튼 표시

2. **Echo 생성 테스트**:
   - "Create an Echo" 버튼 클릭
   - 메시지 입력 (예: "테스트 메시지입니다")
   - 감정 선택 (Achievement, Comfort 등)
   - 간격 선택 (1 day, 3 days 등)
   - "Save Echo" 버튼 클릭

3. **알림 권한 요청**:
   - 첫 실행 시 알림 권한 팝업 → **"Allow" 클릭**

4. **Scheduled Echoes 확인**:
   - 홈 화면에 생성한 Echo가 리스트에 표시되는지 확인

---

## 7. 문제 해결

### 문제 1: 빌드 에러 - "Cannot find type 'Vibe' in scope"

**원인:** SwiftData 모델이 제대로 import되지 않음

**해결:**
1. `EchoApp.swift` 파일 열기
2. 상단에 다음 import 문이 있는지 확인:
   ```swift
   import SwiftUI
   import SwiftData
   ```

### 문제 2: 빌드 에러 - "Asset catalog 'Assets.xcassets' not found"

**원인:** Assets.xcassets 폴더가 Target에 포함되지 않음

**해결:**
1. Project Navigator에서 `Assets.xcassets` 선택
2. 우측 **File Inspector** (⌘ + Option + 1) 열기
3. **Target Membership** 섹션에서 **Echo** 체크

### 문제 3: 런타임 에러 - "Color 'PrimaryBackground' not found"

**원인:** Color Assets가 제대로 복사되지 않음

**해결:**
1. `Assets.xcassets` 폴더 확인
2. 다음 Color Sets가 있는지 확인:
   - PrimaryBackground
   - SecondaryBackground
   - PrimaryText
   - SecondaryText
   - TertiaryText
   - AccentBlue
   - WarningOrange
3. 없으면 Finder에서 `Echo_app/Resources/Assets.xcassets/` 폴더를 다시 드래그

### 문제 4: 런타임 에러 - "quotes.json not found"

**원인:** JSON 파일이 Bundle에 포함되지 않음

**해결:**
1. Project Navigator에서 `quotes.json` 선택
2. 우측 **File Inspector** (⌘ + Option + 1) 열기
3. **Target Membership** 섹션에서 **Echo** 체크
4. `templates.json`도 동일하게 확인

### 문제 5: 시뮬레이터가 너무 느림

**해결:**
1. **File** → **Close Other Simulators** (다른 시뮬레이터 종료)
2. 더 간단한 기기 선택 (iPhone SE 3rd gen)
3. Mac 재시작 후 다시 시도

### 문제 6: 알림이 테스트가 안됨 (시뮬레이터)

**참고:**
- 시뮬레이터에서는 알림이 즉시 테스트하기 어렵습니다
- 실제 테스트는 **실제 iPhone 기기**에서 해야 합니다
- 시뮬레이터에서는 알림 권한 팝업까지만 확인 가능

**실제 기기에서 테스트하려면:**
1. iPhone을 Mac에 USB로 연결
2. Xcode 상단에서 **본인의 iPhone** 선택
3. **Product** → **Run** (⌘ + R)
4. iPhone에서 "개발자 신뢰" 설정 필요 (최초 1회)

---

## 8. 추가 참고사항

### 프로젝트 파일 위치
- Xcode 프로젝트 파일: `~/Documents/Echo/Echo.xcodeproj`
- 소스 코드: `~/Documents/Echo/Echo/`

### Git 사용자를 위한 팁
`.gitignore` 파일에 다음 추가 권장:
```
# Xcode
*.xcworkspace
xcuserdata/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
DerivedData/
.DS_Store
```

### 앱 배포 (App Store)
현재 코드는 **개발 및 테스트용**입니다.
App Store 배포를 위해서는 추가 작업 필요:
- Apple Developer Program 가입 ($99/년)
- App Store Connect 설정
- 개인정보 처리방침 웹페이지 생성
- 서비스 약관 웹페이지 생성
- 앱 아이콘 1024x1024 제작
- 스크린샷 준비

---

## 9. 완료!

축하합니다! 🎉

Echo 앱이 성공적으로 실행되었다면, 다음 기능들을 테스트해보세요:

1. ✅ Echo 생성 (메시지, 감정, 간격 선택)
2. ✅ Scheduled Echoes 리스트 확인
3. ✅ 설정 화면 접근
4. ✅ About Echo 화면 확인
5. ✅ 다크 모드 전환 (Settings → Appearance → Dark)

**문제가 계속 발생한다면:**
- Xcode 메뉴 → **Product** → **Clean Build Folder** (⌘ + Shift + K)
- Xcode 재시작
- Mac 재시작

**도움이 더 필요하면:**
- SRS 문서 (`docs/SRS.md`) 참고
- Design System 문서 (`docs/Design_System.md`) 참고
- 각 소스 파일의 주석 참고

---

**문서 버전:** 1.0.0
**최종 수정:** 2025-11-18
**작성자:** Echo Development Team
