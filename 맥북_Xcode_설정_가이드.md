# Echo 앱 - 맥북 Xcode 설정 가이드

이 가이드는 코드를 잘 모르는 분들도 따라할 수 있도록 **모든 단계를 상세하게** 설명합니다.
천천히 한 단계씩 따라하시면 됩니다.

---

## 📋 목차

1. [필수 준비사항](#1-필수-준비사항)
2. [Xcode 프로젝트 생성](#2-xcode-프로젝트-생성)
3. [프로젝트 파일 구조 만들기](#3-프로젝트-파일-구조-만들기)
4. [코드 파일 추가하기](#4-코드-파일-추가하기)
5. [리소스 파일 추가하기](#5-리소스-파일-추가하기)
6. [Color Assets 추가하기](#6-color-assets-추가하기)
7. [Info.plist 설정하기](#7-infoplist-설정하기)
8. [빌드 및 실행하기](#8-빌드-및-실행하기)
9. [문제 해결](#9-문제-해결)

---

## 1. 필수 준비사항

### 1.1 맥북 요구사항
- **macOS**: Sonoma (14.0) 이상 권장
- **Xcode**: 15.0 이상 필수
- **저장공간**: 최소 10GB 여유 공간

### 1.2 Xcode 설치 확인

1. **Spotlight 검색** (⌘ + Space)을 누르고 "Xcode" 입력
2. Xcode가 없다면:
   - App Store 열기
   - "Xcode" 검색
   - "다운로드" 또는 "받기" 클릭 (약 7GB, 시간 소요됨)

3. Xcode 버전 확인:
   - Xcode 실행
   - 상단 메뉴: **Xcode → About Xcode**
   - 버전이 **15.0 이상**인지 확인

---

## 2. Xcode 프로젝트 생성

### 2.1 새 프로젝트 만들기

1. **Xcode 실행**

2. 시작 화면에서 **"Create New Project"** 클릭
   (또는 메뉴: **File → New → Project**)

3. **템플릿 선택**:
   - 상단 탭에서 **"iOS"** 선택
   - 아래에서 **"App"** 선택
   - 오른쪽 하단 **"Next"** 클릭

4. **프로젝트 설정 입력**:
   ```
   Product Name:        Echo
   Team:               (본인 Apple ID 선택, 없으면 "None")
   Organization Identifier:  com.yourname
   Bundle Identifier:   com.yourname.Echo (자동 생성됨)
   Interface:          SwiftUI
   Language:           Swift
   Storage:            SwiftData
   ```

   **중요**:
   - "Include Tests" 체크박스는 **해제** (선택사항)
   - "Create Git repository" 체크박스는 **선택** (선택사항)

5. **저장 위치 선택**:
   - 원하는 폴더 선택 (예: Documents 또는 Desktop)
   - **"Create"** 클릭

6. **신뢰 경고 창** 뜨면 **"Trust and Open"** 클릭

---

## 3. 프로젝트 파일 구조 만들기

### 3.1 기본 파일 정리

Xcode 왼쪽 **Navigator 영역**에서:

1. **EchoApp.swift** 파일 찾기 (파란색 아이콘)
2. **ContentView.swift** 파일 찾기

**이 두 파일은 삭제하지 마세요!** 나중에 내용만 교체할 겁니다.

### 3.2 폴더(Group) 만들기

**왼쪽 Navigator에서 "Echo" 프로젝트 폴더**를 마우스 우클릭:

1. **"New Group"** 선택하고 이름을 **"Models"** 입력
2. 같은 방법으로 아래 폴더들 생성:
   - **Views**
   - **Services**
   - **Resources**

### 3.3 최종 구조 확인

왼쪽에 이런 구조가 되어야 합니다:

```
Echo
├── Models
├── Views
├── Services
├── Resources
├── EchoApp.swift
├── ContentView.swift (나중에 삭제 예정)
└── Assets.xcassets
```

---

## 4. 코드 파일 추가하기

이제 GitHub에서 받은 코드 파일들을 Xcode 프로젝트에 추가합니다.

### 4.1 Models 폴더에 파일 추가

1. **Finder** 열기
2. GitHub에서 받은 `Echo_app/Models` 폴더 찾기
3. 아래 파일들을 **모두 선택**:
   ```
   Emotion.swift
   Quote.swift
   Vibe.swift
   ```

4. **드래그 앤 드롭**:
   - 선택한 파일들을 Xcode 왼쪽의 **Models 폴더**로 드래그

5. **옵션 창**이 뜨면:
   - ✅ **"Copy items if needed"** 체크
   - ✅ **"Create groups"** 선택
   - ✅ **"Echo" 타겟** 체크 확인
   - **"Finish"** 클릭

### 4.2 Views 폴더에 파일 추가

**같은 방법으로** `Echo_app/Views` 폴더의 파일들 추가:

```
MainTabView.swift
WriteView.swift
RevelationView.swift
SettingsView.swift
EmotionPicker.swift
```

**드래그 앤 드롭 → Models와 동일한 옵션 선택 → Finish**

### 4.3 Services 폴더에 파일 추가

**같은 방법으로** `Echo_app/Services` 폴더의 파일들 추가:

```
NotificationService.swift
RecommendationService.swift
```

### 4.4 EchoApp.swift 교체

1. Xcode에서 **EchoApp.swift** 파일 클릭
2. **모든 내용 선택** (⌘ + A)
3. **삭제** (Delete 키)
4. GitHub의 `Echo_app/EchoApp.swift` 파일을 **텍스트 에디터**로 열기
5. **모든 내용 복사** (⌘ + A, ⌘ + C)
6. Xcode의 비어있는 **EchoApp.swift**에 **붙여넣기** (⌘ + V)
7. **저장** (⌘ + S)

### 4.5 ContentView.swift 삭제

1. **ContentView.swift** 파일 우클릭
2. **"Delete"** 선택
3. **"Move to Trash"** 선택 (프로젝트에서 완전히 제거)

---

## 5. 리소스 파일 추가하기

### 5.1 JSON 파일 추가

1. Finder에서 `Echo_app/Resources` 폴더 찾기
2. 아래 파일들 선택:
   ```
   quotes.json
   templates.json
   ```

3. Xcode 왼쪽 **Resources 폴더**로 드래그
4. 옵션 창:
   - ✅ **"Copy items if needed"** 체크
   - ✅ **"Create groups"** 선택
   - ✅ **"Echo" 타겟** 체크
   - **"Finish"** 클릭

### 5.2 파일 추가 확인

Resources 폴더를 펼쳤을 때:
```
Resources
├── quotes.json
└── templates.json
```

이렇게 보이면 성공!

---

## 6. Color Assets 추가하기

앱의 색상 테마를 추가합니다.

### 6.1 Assets 폴더 열기

1. 왼쪽 Navigator에서 **Assets.xcassets** 클릭
2. 중간 영역에 파란색 아이콘들 보임

### 6.2 Color Set 추가하기

각 색상마다 아래 과정 반복:

#### **PrimaryBackground** 추가:

1. **Assets.xcassets** 우클릭
2. **"New Color Set"** 선택
3. 생성된 "Color" 이름을 **"PrimaryBackground"**로 변경
4. 방금 만든 **PrimaryBackground** 클릭
5. 오른쪽 **Attributes Inspector** (⌘ + ⌥ + 4):
   - **"Appearances"**에서 **"Any, Dark"** 선택

6. **"Any Appearance"** 색상 클릭:
   - **Hex** 입력란에: `#FFFFFF` 입력 (흰색)

7. **"Dark Appearance"** 색상 클릭:
   - **Hex** 입력란에: `#000000` 입력 (검은색)

#### **나머지 색상들**도 같은 방법으로 추가:

| Color Set 이름 | Any Appearance (밝은 모드) | Dark Appearance (다크 모드) |
|---------------|--------------------------|---------------------------|
| **PrimaryBackground** | `#FFFFFF` | `#000000` |
| **SecondaryBackground** | `#F5F5F7` | `#1C1C1E` |
| **PrimaryText** | `#1D1D1F` | `#FFFFFF` |
| **SecondaryText** | `#6E6E73` | `#AEAEB2` |
| **TertiaryText** | `#86868B` | `#8E8E93` |
| **AccentBlue** | `#007AFF` | `#0A84FF` |
| **WarningOrange** | `#FF9500` | `#FF9F0A` |

### 6.3 Hex 입력 방법

만약 Hex 입력란이 안 보이면:

1. 색상 클릭
2. 오른쪽 색상 선택 창에서 **두 번째 탭** (슬라이더 아이콘) 클릭
3. **"Color Space"** 드롭다운을 **"sRGB"**로 선택
4. 그래도 안 보이면:
   - Red, Green, Blue 값을 수동으로 입력
   - 예: `#FFFFFF` = Red: 255, Green: 255, Blue: 255

---

## 7. Info.plist 설정하기

### 7.1 Info.plist 찾기

1. 왼쪽 Navigator 최상단의 **"Echo" 프로젝트** (파란색 아이콘) 클릭
2. 중간 영역에서 **"Echo" 타겟** 선택
3. 상단 탭에서 **"Info"** 클릭

### 7.2 알림 권한 설명 추가

1. **"Custom iOS Target Properties"** 섹션에서:
2. 빈 공간 우클릭 → **"Add Row"** 선택
3. **Key** 입력:
   ```
   Privacy - User Notifications Usage Description
   ```
   (입력하기 시작하면 자동완성 목록이 나타남)

4. **Value** 입력:
   ```
   Echo는 예약된 시간에 타임캡슐 메시지를 전달하기 위해 알림 권한이 필요합니다.
   ```

### 7.3 추가 설정 (선택사항)

원한다면 아래 항목들도 수정 가능:

- **Bundle Display Name**: `Echo` (앱 아이콘 아래 표시될 이름)
- **Bundle Version String**: `1.0` (유지)
- **Supported Interface Orientations**: Portrait만 남기고 나머지 삭제 (세로 모드만 지원)

---

## 8. 빌드 및 실행하기

### 8.1 빌드 설정 확인

1. 상단 중앙의 **디바이스 선택 버튼** 클릭
2. **시뮬레이터** 선택:
   - 추천: **iPhone 15 Pro** (또는 사용 가능한 최신 기종)
   - 없다면: **Xcode → Settings → Platforms**에서 다운로드

### 8.2 첫 빌드 실행

1. **⌘ + B** (또는 상단 메뉴: **Product → Build**)
2. 빌드 진행 상황이 상단에 표시됨
3. **"Build Succeeded"** 메시지 대기 (첫 빌드는 1-2분 소요)

### 8.3 앱 실행

1. **⌘ + R** (또는 상단의 ▶️ 재생 버튼 클릭)
2. 시뮬레이터가 실행되고 앱이 설치됨
3. **Echo 앱** 자동 실행

### 8.4 앱 테스트

앱이 실행되면:

1. **Write 탭**: Vibe 작성 테스트
2. **감정 선택**: Achievement, Comfort 등
3. **Revelation 탭**: 저장된 Vibe 확인
4. **Settings 탭**: 설정 확인

---

## 9. 문제 해결

### 9.1 빌드 오류: "Cannot find type 'Vibe'"

**원인**: 파일이 제대로 추가되지 않음

**해결**:
1. 왼쪽 Navigator에서 해당 파일 찾기
2. 파일 선택 후 오른쪽 **File Inspector** (⌘ + ⌥ + 1) 열기
3. **"Target Membership"** 섹션에서 **"Echo"** 체크박스 확인
4. 체크 안 되어 있으면 체크

### 9.2 빌드 오류: "No such module 'SwiftData'"

**원인**: iOS 타겟 버전이 낮음

**해결**:
1. 왼쪽 Navigator에서 **Echo 프로젝트** (파란색 아이콘) 클릭
2. **Echo 타겟** 선택
3. **"General"** 탭
4. **"Minimum Deployments"**를 **iOS 17.0** 이상으로 변경

### 9.3 빌드 오류: "Bundle identifier is not valid"

**원인**: Bundle ID 형식 문제

**해결**:
1. **General** 탭에서 **Bundle Identifier** 확인
2. 형식: `com.yourname.Echo` (소문자, 공백 없음)
3. 수정 후 다시 빌드

### 9.4 실행 오류: "quotes.json not found"

**원인**: JSON 파일이 번들에 포함되지 않음

**해결**:
1. **quotes.json** 파일 클릭
2. 오른쪽 **File Inspector**에서 **"Target Membership"** 확인
3. **"Echo"** 체크박스 체크
4. **templates.json**도 동일하게 확인

### 9.5 색상이 제대로 안 나옴

**원인**: Color Assets 이름 오타

**해결**:
1. **Assets.xcassets** 열기
2. Color Set 이름들 확인:
   - 대소문자 정확히 일치해야 함
   - 예: `PrimaryBackground` (O), `primarybackground` (X)

### 9.6 시뮬레이터가 너무 느림

**해결**:
1. 상단 디바이스 선택에서 **iPhone SE (3rd generation)** 같은 가벼운 기종 선택
2. 또는 Xcode 재시작

### 9.7 알림이 작동 안 함 (시뮬레이터)

**참고**: 시뮬레이터에서는 알림이 제한적으로 작동할 수 있습니다.

**실제 기기 테스트**:
1. iPhone을 맥북에 연결
2. 상단 디바이스 선택에서 **본인 iPhone** 선택
3. **처음 연결 시**: iPhone에서 "신뢰" 버튼 눌러야 함
4. 빌드 후 실행 (⌘ + R)

---

## 10. 다음 단계

### 10.1 앱 아이콘 추가 (선택사항)

1. **Assets.xcassets** → **AppIcon** 클릭
2. 1024x1024 PNG 이미지를 **App Store** 칸에 드래그
3. Xcode가 자동으로 다른 크기 생성

### 10.2 실제 기기 배포

1. **유료 Apple Developer 계정** 필요 (연 $99)
2. 계정 없이 테스트:
   - 본인 Apple ID로 7일간 설치 가능
   - **Signing & Capabilities** 탭에서 Team을 본인 Apple ID로 선택

### 10.3 TestFlight 배포

1. App Store Connect 가입
2. Xcode에서 **Product → Archive**
3. Archive 후 **Distribute App** → **TestFlight**

---

## 📞 추가 도움말

### 유용한 단축키

- **⌘ + B**: 빌드
- **⌘ + R**: 실행
- **⌘ + .**: 빌드/실행 중지
- **⌘ + K**: 콘솔 지우기
- **⌘ + 0**: Navigator 토글
- **⌘ + Shift + Y**: 디버그 영역 토글

### Xcode 용어 정리

- **Navigator**: 왼쪽 파일 목록 영역
- **Editor**: 가운데 코드 편집 영역
- **Inspector**: 오른쪽 속성 설정 영역
- **Debug Area**: 하단 로그/콘솔 영역
- **Target**: 빌드할 앱의 설정 묶음
- **Scheme**: 빌드/실행 방식 설정

---

## ✅ 완료!

축하합니다! Echo 앱을 성공적으로 Xcode에서 실행하셨습니다.

앱은 다음 기능들을 포함하고 있습니다:

- ✅ **160개 이중언어 명언** (영어/한국어)
- ✅ **160개 이중언어 템플릿**
- ✅ **8가지 감정 카테고리**
- ✅ **AI 기반 추천 시스템**
- ✅ **타임캡슐 기능**
- ✅ **라이트/다크 모드 지원**
- ✅ **알림 시스템**

---

**마지막 업데이트**: 2025-11-18
**버전**: 1.0
**Xcode**: 15.0+
**iOS**: 17.0+
