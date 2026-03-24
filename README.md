# Oshiz Mini-App Harness Agent

오시즈 미니앱 아이디어 제너레이터(Studio)에서 선별된 아이디어를 받아, **미니앱을 기획 → 구현 → 배포**하는 AI 개발 에이전트.

> 📄 **상품설계서 & 사용 매뉴얼**: [Notion 문서](https://www.notion.so/vivident/32540659e42480419624d973067d8b91)

## 시스템 내 위치

```
[Studio 웹앱] 아이디어 생성 → 평가 → 선별 → 제작 요청서
       ↓
[이 에이전트] 요청서 파싱 → 분류 → 기획 → 점진적 구현 → 배포
       ↓
[완성된 미니앱] Vercel 배포 URL
```

- **Studio**: https://github.com/kiheonshin/oshiz-miniapp-studio
- **이 에이전트**: https://github.com/kiheonshin/harness-agent/tree/oshiz-miniapp-agent

## 내장된 도메인 지식 (6개 스킬)

| 스킬 | 용도 |
|------|------|
| **oshiz-miniapp-strategy** | 4축 분류, 7기준 사업성 평가(35점), KPI 가설, CTA 패턴, 포트폴리오 관리 |
| **oshiz-characters** | 이돌라 8인 캐릭터 프로필, 말투 가이드, 시너지 8쌍 |
| **oshiz-world** | 이돌라 세계관 4구역 64장소, 종족, 핵심 테마 |
| **oshiz-idea-templates** | 14개 아이디어 생성 템플릿 (Goal × Format 조합) |
| **oshiz-request-interpreter** | Studio 요청서 파싱 → feature_list.json 변환, 검증 체크리스트 |
| **oshiz-studio-connector** | Studio ↔ Agent 데이터 흐름, Notion DB 연동, 상태 동기화 |

## 구조

```
.
├── CLAUDE.md                          ← 에이전트 행동 규칙
├── claude-progress.txt                ← 세션 간 상태 기록
├── .claude/
│   ├── agents/                        ← 4개 역할 에이전트
│   │   ├── requirements-analyst.md
│   │   ├── implementation-engineer.md
│   │   ├── quality-reviewer.md
│   │   └── oshiz-brand-guardian.md
│   ├── skills/                        ← 6개 도메인 스킬 (위 표 참조)
│   └── settings.json
├── _workspace/                        ← 작업 상태 문서
├── docs/
│   ├── references.json                ← Notion 참조 문서 레지스트리
│   └── extracted-traits.md            ← 오시즈 특성 추출 기록
├── projects/                          ← 미니앱 프로젝트 산출물
└── scripts/
    └── validate-workspace.ps1
```

## 사용 방법

### 방법 A — Studio에서 요청서 전달 (추천)

1. [Studio](https://oshiz-miniapp-studio.vercel.app)에서 아이디어 생성 → 평가 → 선별
2. 칸반 보드에서 `sent-to-build`로 이동
3. "Harness" 탭 → 복사
4. Claude Code 대화에 붙여넣기
5. 에이전트가 자동 파싱 → 분류 → 구현 계획 → 승인 요청

### 방법 B — 자연어 요청

```
"이돌라 투어 가이드 앱을 만들고 싶어"
"비앙카를 주인공으로 한 미식 퀴즈 앱"
"신규 유저 유입용 가벼운 캐릭터 매칭 카드"
```

에이전트가 4축 분류 → 기능 목록 생성 → 승인 후 구현.

### 방법 C — Notion DB 태스크

Studio에서 Notion으로 내보내기 → 에이전트가 세션 시작 시 자동 확인.

## 에이전트 워크플로우

```
1. 요청 수신 (3가지 경로)
2. 4축 분류 (Goal × Format × Lifecycle × Complexity)
3. feature_list.json + app-brief.md 생성
4. 사용자 승인
5. 기능별 점진적 구현 (한 번에 하나씩)
6. 매 기능 완료 후 사용자 확인
7. 전체 완료 → 배포 (Vercel)
8. Notion 상태 업데이트
```

## 스킬 의존 관계

```
사용자 요청
    │
    ▼
oshiz-request-interpreter ← 요청 구조화
    ├── oshiz-miniapp-strategy  ← 분류 + 평가
    ├── oshiz-characters        ← 캐릭터 참조
    ├── oshiz-world             ← 장소 참조
    └── oshiz-idea-templates    ← 패턴 참조
    │
    ▼
점진적 구현 → 배포
    │
    ▼
oshiz-studio-connector ← Notion 상태 동기화
```

## 기술 스택

- Next.js + TypeScript + Tailwind CSS
- 상태 관리: localStorage (프론트엔드 전용)
- 배포: Vercel
- 외부 연동: Notion API (MCP 기반)
- 디자인: 다크 모드, 모바일 퍼스트

## 관련 문서

- [상품설계서 & 사용 매뉴얼](https://www.notion.so/vivident/32540659e42480419624d973067d8b91)
- [미니앱 아이디어 제너레이터 문서](https://www.notion.so/vivident/32540659e4248034ba10cdbd81baaca2)
- [하네스 에이전트 설계 문서](https://www.notion.so/vivident/32540659e42480feb1bde988bab66ff4)
