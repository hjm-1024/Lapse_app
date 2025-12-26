# Echo 앱 - Swift Playgrounds 초간단 가이드

**Xcode보다 10배 쉽습니다!** 코딩을 1도 몰라도 따라할 수 있어요.

---

## ⏱️ 총 소요시간: 약 20분

- Swift Playgrounds 설치: 5분
- 프로젝트 생성: 2분
- 코드 복사: 10분
- 실행: 1분

---

## 1️⃣ Swift Playgrounds 설치 (5분)

### 1.1 App Store 열기
1. **Dock**에서 **App Store** 클릭 (파란색 A 아이콘)
2. 또는 **Spotlight** (⌘ + Space) → "App Store" 입력

### 1.2 Swift Playgrounds 다운로드
1. App Store 왼쪽 상단 **검색창**에 "Swift Playgrounds" 입력
2. **"Swift Playgrounds"** 앱 찾기 (Apple 제작, 무료)
3. **"받기"** 또는 **"다운로드"** 버튼 클릭
4. Apple ID 비밀번호 입력 (요구 시)
5. 다운로드 완료 대기 (약 500MB, 3-5분)

### 1.3 앱 실행
1. **Launchpad** (Dock에서 로켓 아이콘) 클릭
2. **"Swift Playgrounds"** 아이콘 클릭
3. 또는 Spotlight (⌘ + Space) → "Swift Playgrounds" 입력

---

## 2️⃣ 새 앱 프로젝트 생성 (2분)

### 2.1 프로젝트 만들기
1. Swift Playgrounds 실행 후 시작 화면
2. **"App"** 탭 클릭 (상단 메뉴)
3. **"+ New App"** 버튼 클릭 (또는 "+앱" 버튼)

### 2.2 템플릿 선택
1. **"Blank App"** (빈 앱) 선택
2. 오른쪽 하단 **"Choose"** 또는 **"선택"** 클릭

### 2.3 프로젝트 이름 설정
1. 프로젝트 이름: **"Echo"** 입력
2. **"Create"** 또는 **"생성"** 클릭
3. 저장 위치: 기본값 그대로 (Documents) OK

### 2.4 화면 구성 확인
생성되면 이런 화면이 보입니다:
```
┌─────────────────────────────────────────┐
│ 왼쪽: 파일 목록 (Navigator)              │
│ 가운데: 코드 편집 영역                   │
│ 오른쪽: 미리보기 (Preview)               │
└─────────────────────────────────────────┘
```

---

## 3️⃣ 폴더 구조 만들기 (2분)

### 3.1 기본 파일 확인
왼쪽 Navigator에 이런 파일들이 있을 겁니다:
- MyApp.swift (또는 EchoApp.swift)
- ContentView.swift

### 3.2 폴더 만들기

**왼쪽 Navigator 영역에서:**

1. **"Echo"** 프로젝트 이름 우클릭
2. **"New Folder"** 선택

3. 폴더 이름 **"Models"** 입력 → Enter
4. 같은 방법으로 아래 폴더들도 생성:
   - **Views**
   - **Services**
   - **Resources**

### 3.3 최종 구조
```
Echo
├── Models/
├── Views/
├── Services/
├── Resources/
├── MyApp.swift (또는 EchoApp.swift)
└── ContentView.swift
```

---

## 4️⃣ 코드 파일 추가하기 (10분)

### 4.1 Models 폴더에 파일 추가

#### **Emotion.swift 추가**

1. **Models 폴더** 우클릭
2. **"New File"** 선택
3. 파일 이름: **"Emotion"** 입력 (확장자 .swift 자동 추가됨)
4. Enter 또는 Create 클릭
5. **Finder 열기**:
   - GitHub에서 받은 `Echo_app/Models/Emotion.swift` 파일 찾기
   - 파일 더블클릭 → 텍스트 에디터로 열림
   - **전체 선택** (⌘ + A) → **복사** (⌘ + C)
6. **Swift Playgrounds로 돌아와서**:
   - 방금 만든 **Emotion.swift** 클릭
   - 기존 내용 **전체 선택** (⌘ + A) → **삭제**
   - **붙여넣기** (⌘ + V)

#### **Quote.swift 추가**

같은 방법으로:
1. Models 폴더 우클릭 → New File → "Quote" 입력
2. GitHub의 `Echo_app/Models/Quote.swift` 내용 복사
3. Swift Playgrounds의 Quote.swift에 붙여넣기

#### **Vibe.swift 추가**

1. Models 폴더 우클릭 → New File → "Vibe" 입력
2. GitHub의 `Echo_app/Models/Vibe.swift` 내용 복사
3. Swift Playgrounds의 Vibe.swift에 붙여넣기

### 4.2 Views 폴더에 파일 추가

**같은 방법으로 아래 파일들 추가**:

각 파일마다:
1. Views 폴더 우클릭 → New File → 파일 이름 입력
2. GitHub 해당 파일 내용 복사 → 붙여넣기

**추가할 파일 목록**:
- **MainTabView** (← MainTabView.swift)
- **WriteView** (← WriteView.swift)
- **RevelationView** (← RevelationView.swift)
- **SettingsView** (← SettingsView.swift)
- **EmotionPicker** (← EmotionPicker.swift)

### 4.3 Services 폴더에 파일 추가

**같은 방법으로**:
- **NotificationService** (← NotificationService.swift)
- **RecommendationService** (← RecommendationService.swift)

### 4.4 메인 앱 파일 교체

1. 왼쪽에서 **MyApp.swift** (또는 EchoApp.swift) 클릭
2. GitHub의 `Echo_app/EchoApp.swift` 내용 복사
3. 전체 선택 (⌘ + A) → 붙여넣기 (⌘ + V)

### 4.5 ContentView.swift 삭제

1. **ContentView.swift** 우클릭
2. **"Delete"** 선택
3. 확인 창에서 **"Delete"** 클릭

---

## 5️⃣ 리소스 파일 추가 (3분)

### 5.1 JSON 파일 추가

**quotes.json 추가**:

1. **Resources 폴더** 우클릭
2. **"Add Files..."** 선택 (또는 "New File")
3. **Finder 창**이 열림
4. GitHub에서 받은 `Echo_app/Resources/quotes.json` 파일 찾기
5. 파일 선택 → **"Add"** 또는 **"열기"** 클릭

**templates.json 추가**:

같은 방법으로 `templates.json` 파일도 추가

**또는 수동으로**:
1. Resources 폴더 우클릭 → New File → "quotes" 입력
2. 파일 이름을 **"quotes.json"**으로 변경 (확장자 포함!)
3. 파일 클릭 → GitHub의 quotes.json 내용 전체 복사 붙여넣기
4. templates.json도 동일하게

---

## 6️⃣ 앱 실행하기! (1분)

### 6.1 미리보기 실행

1. 왼쪽에서 **아무 View 파일** 클릭 (예: MainTabView.swift)
2. 오른쪽 **미리보기 영역** 확인
3. 상단에 **"Run My App"** 버튼 클릭 (▶️ 재생 버튼)

### 6.2 전체 화면으로 실행

1. 상단 메뉴: **Run (실행)** 클릭
2. 또는 단축키: **⌘ + R**
3. 새 창에서 앱 실행됨!

### 6.3 iPhone/iPad에서 실행

1. iPhone/iPad를 Mac에 연결 (Lightning/USB-C 케이블)
2. 상단에 **디바이스 선택** 드롭다운 클릭
3. **본인의 iPhone/iPad** 선택
4. **Run** 클릭 (⌘ + R)
5. 처음 연결 시 iPhone에서 **"신뢰"** 버튼 눌러야 함

---

## 7️⃣ 색상 테마 추가 (선택사항)

Swift Playgrounds에서는 Color Assets을 직접 추가하기 어렵습니다.
하지만 **코드로 색상을 정의**하면 작동합니다!

### 7.1 Colors.swift 파일 생성

1. 최상위 (Echo 프로젝트) 우클릭 → New File
2. 파일 이름: **"Colors"** 입력
3. 아래 코드 복사 → 붙여넣기:

```swift
//
//  Colors.swift
//  Echo
//

import SwiftUI

extension Color {
    // Primary Colors
    static let primaryBackground = Color(
        light: Color(hex: "#FFFFFF"),
        dark: Color(hex: "#000000")
    )

    static let secondaryBackground = Color(
        light: Color(hex: "#F5F5F7"),
        dark: Color(hex: "#1C1C1E")
    )

    // Text Colors
    static let primaryText = Color(
        light: Color(hex: "#1D1D1F"),
        dark: Color(hex: "#FFFFFF")
    )

    static let secondaryText = Color(
        light: Color(hex: "#6E6E73"),
        dark: Color(hex: "#AEAEB2")
    )

    static let tertiaryText = Color(
        light: Color(hex: "#86868B"),
        dark: Color(hex: "#8E8E93")
    )

    // Accent Colors
    static let accentBlue = Color(
        light: Color(hex: "#007AFF"),
        dark: Color(hex: "#0A84FF")
    )

    static let warningOrange = Color(
        light: Color(hex: "#FF9500"),
        dark: Color(hex: "#FF9F0A")
    )

    // Helper initializer
    init(light: Color, dark: Color) {
        self.init(uiColor: UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }
}
```

### 7.2 기존 Color 참조 수정

이미 작성한 View 파일들에서 색상이 다음처럼 사용됩니다:
```swift
Color("PrimaryText")  // ← 이렇게 되어 있으면
```

이걸 이렇게 바꾸면 됩니다:
```swift
Color.primaryText  // ← 이렇게 변경
```

**하지만!** 제가 만든 코드는 이미 `Color("PrimaryText")` 형식으로 되어 있으므로,
Swift Playgrounds에서는 색상이 안 나올 수 있습니다.

**해결 방법**:
1. 일단 앱 실행해보기 (기본 색상으로라도 작동함)
2. 나중에 Xcode로 옮기면 Color Assets 사용 가능

---

## 8️⃣ 문제 해결

### 오류: "Cannot find type 'Vibe'"

**원인**: 파일을 제대로 추가 안 함

**해결**:
1. 왼쪽 Navigator에서 해당 파일이 있는지 확인
2. 없으면 다시 추가
3. 파일 이름 확인 (대소문자 정확히)

### 오류: "quotes.json not found"

**원인**: Resources 폴더에 JSON 파일 없음

**해결**:
1. Resources 폴더 열기
2. quotes.json, templates.json 파일 확인
3. 파일 이름 정확한지 확인 (소문자)

### 색상이 이상해요

**원인**: Swift Playgrounds는 Color Assets 미지원

**해결**:
1. 위의 "7️⃣ 색상 테마 추가" 섹션 참고
2. Colors.swift 파일 추가
3. 또는 일단 기본 색상으로 사용 (나중에 Xcode에서 수정)

### 앱이 실행 안 돼요

**체크리스트**:
- [ ] 모든 Swift 파일 추가했나요? (Models, Views, Services)
- [ ] JSON 파일 추가했나요? (quotes.json, templates.json)
- [ ] EchoApp.swift 내용 교체했나요?
- [ ] ContentView.swift 삭제했나요?

**그래도 안 되면**:
1. 오른쪽 상단 **"Issues"** 버튼 클릭
2. 에러 메시지 확인
3. 에러 메시지 복사해서 질문하기

---

## 9️⃣ App Store에 제출하기

Swift Playgrounds에서 만든 앱도 App Store에 제출 가능합니다!

### 9.1 Apple Developer 계정 필요
- 연 $99 (약 13만원)
- https://developer.apple.com 에서 가입

### 9.2 제출 방법
1. Swift Playgrounds 상단 메뉴: **File → Submit to App Store Connect**
2. 계정 로그인
3. 앱 정보 입력 (이름, 설명, 스크린샷 등)
4. 제출 → Apple 심사 대기 (1-3일)

---

## ✅ 완료!

축하합니다! Swift Playgrounds로 Echo 앱을 실행하셨습니다!

### 다음 단계:

1. **앱 테스트하기**:
   - Write 탭에서 Vibe 작성
   - Revelation 탭에서 확인
   - Settings에서 설정 변경

2. **실제 iPhone에서 실행**:
   - iPhone 연결
   - Run 클릭

3. **나중에 Xcode로 업그레이드**:
   - Swift Playgrounds 프로젝트는 Xcode에서도 열림
   - File → Export → Xcode Project

---

**Swift Playgrounds 장점 요약**:
- ✅ Xcode보다 **10배 쉬움**
- ✅ 설정 **최소화**
- ✅ 코드 **즉시 미리보기**
- ✅ iPhone/iPad에서 **바로 실행**
- ✅ **무료**
- ✅ App Store 제출 **가능**

**Xcode로 넘어가야 할 때**:
- ⚠️ 복잡한 디버깅 필요
- ⚠️ Color Assets 같은 고급 리소스 사용
- ⚠️ 프로페셔널한 개발 환경 원할 때

---

**마지막 업데이트**: 2025-11-18
**Swift Playgrounds**: 4.0+
**macOS**: Ventura (13.0)+
