# Echo - Your Voice from the Past

**타임캡슐 형식의 iOS 감정 기록 앱**

<p align="center">
  <em>오늘의 감정을 미래의 나에게 전달하는 특별한 경험</em>
</p>

---

## 📱 Echo란?

Echo는 당신의 일상 순간을 미래의 선물로 바꾸는 미니멀한 iOS 앱입니다.

매일 짧은 문장 하나(Vibe)를 기록하면, 그것은 즉시 사라집니다. 그리고 정확히 **설정한 시간이 지난 후**, 로컬 알림을 통해 다시 나타나 과거의 나와 특별한 순간을 공유합니다.

## ✨ 주요 기능

### 🎯 핵심 기능
- **Vibe 작성**: 하루 한 번, 감정과 함께 짧은 문장 기록
- **8가지 감정**: Achievement, Comfort, Motivation, Gratitude, Struggle, Joy, Reflection, Hope
- **타임캡슐**: 작성 즉시 숨겨지고, 설정한 시간 후 알림으로 전달
- **AI 추천**: 감정 맥락 기반 스마트 추천 메시지 (완전 로컬 처리)

### 🌏 이중언어 지원
- **160개 명언** (영어/한국어)
- **160개 AI 템플릿** (영어/한국어)
- **동시 표시**: 영어와 한국어를 함께 보여주는 이중언어 UI

### 🔒 프라이버시 우선
- **100% 로컬 저장**: 모든 데이터는 기기에만 저장
- **서버 없음**: 네트워크 연결 불필요
- **SwiftData**: iOS 17+ 최신 로컬 데이터베이스 사용

### 🎨 디자인
- **미니멀리즘**: 군더더기 없는 깔끔한 인터페이스
- **라이트/다크 모드**: 자동 시스템 테마 지원
- **SwiftUI**: 네이티브 iOS 17+ 기술 스택

---

## 📂 프로젝트 구조

```
Echo_app/
├── Models/              # 데이터 모델 (Vibe, Quote, Emotion)
├── Views/               # SwiftUI 화면 (Write, Revelation, Settings)
├── Services/            # 비즈니스 로직 (Notification, Recommendation)
├── Resources/           # 리소스 파일
│   ├── quotes.json      # 160개 이중언어 명언
│   └── templates.json   # 160개 이중언어 템플릿
└── EchoApp.swift        # 앱 진입점

docs/
├── SRS.md               # 소프트웨어 요구사항 명세서
└── SRS_v1.0_archived_Lapse.md  # 아카이브된 초기 버전

맥북_Xcode_설정_가이드.md        # Xcode 초보자용 상세 가이드
Swift_Playgrounds_초간단_가이드.md  # Swift Playgrounds 간단 가이드
```

---

## 🚀 시작하기

### 필수 요구사항
- **macOS**: Sonoma (14.0) 이상
- **Xcode**: 15.0 이상
- **iOS**: 17.0 이상 (타겟 디바이스)

### 설치 방법

#### 옵션 1: Swift Playgrounds (추천 - 초보자용) ⭐
가장 쉽고 빠른 방법! 코딩을 몰라도 OK.

1. App Store에서 **"Swift Playgrounds"** 다운로드 (무료)
2. **[Swift_Playgrounds_초간단_가이드.md](./Swift_Playgrounds_초간단_가이드.md)** 파일 열기
3. 가이드 따라하기 (약 20분 소요)

#### 옵션 2: Xcode (전문가용)
본격적인 개발 환경을 원한다면.

1. App Store에서 **"Xcode"** 다운로드 (약 7GB)
2. **[맥북_Xcode_설정_가이드.md](./맥북_Xcode_설정_가이드.md)** 파일 열기
3. 가이드 따라하기 (약 40-50분 소요)

---

## 📚 문서

- **[SRS.md](./docs/SRS.md)**: 완전한 소프트웨어 요구사항 명세서 (IEEE 830 기반)
- **[맥북_Xcode_설정_가이드.md](./맥북_Xcode_설정_가이드.md)**: Xcode 초보자용 466줄 상세 가이드
- **[Swift_Playgrounds_초간단_가이드.md](./Swift_Playgrounds_초간단_가이드.md)**: Swift Playgrounds 434줄 초간단 가이드

---

## 🎨 기술 스택

### **iOS 네이티브**
- **SwiftUI**: 선언형 UI 프레임워크
- **SwiftData**: iOS 17+ 로컬 데이터베이스
- **UserNotifications**: 로컬 알림 시스템
- **NaturalLanguage**: 키워드 추출 (AI 추천)

### **아키텍처**
- **MVVM 패턴**: Model-View-ViewModel 구조
- **Singleton Services**: NotificationService, RecommendationService
- **Codable JSON**: 데이터 직렬화/역직렬화

### **콘텐츠**
- **160개 이중언어 명언**: 19개 카테고리 (Stoicism, Leadership, Mindfulness 등)
- **160개 AI 템플릿**: 8개 감정별 20개씩

---

## 📊 주요 통계

| 항목 | 수량 | 설명 |
|------|------|------|
| **Swift 파일** | 10개 | Models(3) + Views(5) + Services(2) |
| **명언** | 160개 | 20개/감정 × 8개 감정, 이중언어 |
| **템플릿** | 160개 | 20개/감정 × 8개 감정, 이중언어 |
| **감정 카테고리** | 8개 | Achievement, Comfort, Motivation 등 |
| **명언 카테고리** | 19개 | Stoicism, Leadership, Psychology 등 |
| **지원 언어** | 2개 | English, Korean (동시 표시) |

---

## 🎯 로드맵

### ✅ 완료 (v1.0)
- [x] 핵심 타임캡슐 기능
- [x] 8가지 감정 시스템
- [x] 160개 이중언어 명언
- [x] 160개 이중언어 AI 템플릿
- [x] 로컬 알림 시스템
- [x] 라이트/다크 모드
- [x] Xcode 초보자 가이드
- [x] Swift Playgrounds 가이드

### 🚧 계획 중 (v1.1)
- [ ] 위젯 지원 (홈 화면)
- [ ] iCloud 동기화 (선택적)
- [ ] 데이터 내보내기 (JSON, PDF)
- [ ] 통계 대시보드
- [ ] 추가 언어 지원 (일본어, 중국어)

---

## 🤝 기여

이 프로젝트는 개인 프로젝트로 시작되었습니다.

개선 제안이나 버그 리포트는 언제든 환영합니다!

---

## 📄 라이선스

**Copyright © 2025 Echo Development Team**

이 프로젝트는 교육 및 개인 사용 목적으로 제공됩니다.

---

## 🙏 감사의 말

### 명언 출처
- Marcus Aurelius, Seneca (Stoicism)
- Thich Nhat Hanh, Pema Chödrön (Mindfulness)
- Steve Jobs, Winston Churchill (Leadership)
- Rumi, Dalai Lama (Spirituality)
- 그 외 수많은 철학자, 작가, 사상가들

### 기술
- Apple (SwiftUI, SwiftData, iOS)
- Swift Community
- IEEE 830 Standards

---

## 📞 문의

프로젝트에 대한 질문이나 피드백이 있으시면 이슈를 생성해주세요.

---

<p align="center">
  <strong>Echo</strong> - 오늘의 목소리가 내일의 위안이 되도록
</p>

<p align="center">
  Made with ❤️ for mindful reflection
</p>
