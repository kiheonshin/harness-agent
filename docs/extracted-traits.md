# Extracted Oshiz Mini App Traits

이 문서는 `kiheonshin/harness-agent`의 `oshiz-miniapp-agent` branch에서 드러난 Oshiz Mini App 전용 특징을 추출한 기록이다.

## Source Files

- `CLAUDE.md`
- `claude-progress.txt`
- `docs/references.json`
- `.claude/settings.json`

## Extracted Traits

### 1. Product Identity

- Oshiz는 일반 챗봇이 아니라 AI 캐릭터 플랫폼이다.
- 미니앱은 게임과 AI 채팅의 중간지대에 있는 `Life App`으로 정의된다.
- 짧은 세션에서도 관계 깊이와 세계관 몰입을 전달해야 한다.

### 2. Planning Framework

- 모든 요청은 `purpose / complexity / implementation shape`로 먼저 분류한다.
- 목적 분류는 `acquisition`, `experiment`, `ip-extension`, `community`, `internal-demo`를 사용한다.
- 복잡도는 `lite`, `standard`, `heavy`로 나눈다.
- 구현 형태는 `frontend-only`, `stub-backend`, `real-backend`를 사용한다.

### 3. Scope Strategy

- 범위가 크면 기본적으로 `1-day MVP → 3-day MVP → 1-week MVP`로 압축한다.
- 큰 비전보다 작고 검증 가능한 배포 단위를 우선한다.

### 4. Delivery Rules

- 기능 단위 또는 논리적 배치 단위로 점진적으로 진행한다.
- 사용자에게는 매 단계 결과를 시각적으로 설명하고 확인을 받는다.
- 실제 앱뿐 아니라 `app-brief`, `feature_list`, `implementation-notes`, 이벤트 스키마 아이디어 같은 재사용 자산도 남긴다.

### 5. Brand/IP Behavior

- 캐릭터 톤, 세계관, IP 일관성을 별도 품질 기준으로 본다.
- 메인 Oshiz 플랫폼과의 연결 지점을 항상 검토한다.
- 시각적 기본 톤은 깔끔하고 감정적이며 약간 장난스러운 방향이다.

### 6. UX Defaults

- 모바일 우선
- 최소 터치 영역 44x44px
- 본문 글자 최소 16px
- 다크 모드 지원

### 7. Knowledge Strategy

- 외부 문서는 `docs/references.json` 레지스트리를 통해 선택적으로 읽는다.
- Notion이 기본 지식 저장소지만, 연결이 실패해도 로컬 파일만으로 핵심 워크플로가 동작해야 한다.

## How This Variant Uses The Traits

- 루트 기본 하네스는 유지한다.
- `variants/oshiz-miniapp-agent`는 위 특징을 추가한 파생 하네스다.
- 기본 하네스의 파일 기반 상태 관리 방식은 유지하되, Oshiz 전용 분류/브랜드/레지스트리 레이어를 더했다.
