# Oshiz Mini App Harness Memory

이 하네스는 Oshiz Mini App 전용 버전이다.
기본 하네스의 파일 기반 작업 방식 위에 Oshiz 제품 정체성과 미니앱 운영 규칙을 추가한다.

## 제품 정체성

- Oshiz는 일반 챗봇 제품이 아니라 AI 캐릭터 플랫폼이다.
- 목표는 게임과 AI 채팅의 중간지대에 있는 가볍지만 의미 있는 `Life App` 경험이다.
- 짧은 세션에서도 관계 깊이와 세계관 몰입감을 효율적으로 전달해야 한다.
- 빈 채팅창보다 풍부한 캐릭터/세계 경험을 우선한다.
- 빠른 프로토타이핑과 사용자 검증으로 IP를 실험하고 학습한다.

## 기본 목표

- 사용자 요청을 한국어로 명확히 구조화한다.
- 기획 전에 앱 분류와 스코프 압축을 먼저 수행한다.
- 구현 중에는 Oshiz 브랜드/IP 일관성을 지속적으로 확인한다.
- 산출물을 재사용 가능한 패턴과 문서로 남긴다.

## 세션 시작 순서

1. `README.md`를 읽어 이 파생 버전의 목적을 이해한다.
2. `claude-progress.txt`를 읽어 최근 상태를 복원한다.
3. `_workspace/*.md`를 모두 읽는다.
4. `docs/references.json`을 읽어 필요한 외부 문서 후보를 확인한다.
5. 현재 작업 중인 `projects/{project-name}`가 있으면 관련 문서를 읽는다.
6. 현재 상태와 다음 할 일을 한국어로 짧게 요약한다.

## 요청 분류

모든 새 요청은 계획 전에 아래 세 축으로 먼저 분류한다.

### Purpose

- `acquisition`
- `experiment`
- `ip-extension`
- `community`
- `internal-demo`

### Complexity

- `lite`
- `standard`
- `heavy`

### Implementation Shape

- `frontend-only`
- `stub-backend`
- `real-backend`

분류 결과는 `_workspace/00_input.md`에 남기고, 사용자에게도 간단히 설명한다.

## 스코프 압축

요청이 넓거나 불명확하면 기본적으로 아래 순서로 압축한다.

1. 1일 MVP
2. 3일 MVP
3. 1주 MVP

작고 배포 가능한 단위를 과도한 확장보다 우선한다.

## 작업 원칙

- 구현 전에 `_workspace/00_input.md`와 `_workspace/01_plan.md`를 최신 상태로 만든다.
- 앱이 캐릭터나 세계관을 다루면 톤과 일관성을 확인한다.
- 메인 Oshiz 플랫폼과의 연결 포인트를 항상 한 번은 검토한다.
- 모바일 우선 UI를 기본값으로 본다.
- 사용자에게는 기술 용어보다 결과 중심 설명을 제공한다.
- 의미 있는 수정이 끝날 때마다 `_workspace/02_build_log.md`와 `claude-progress.txt`를 갱신한다.

## 파일 계약

- `_workspace/00_input.md`
  현재 요청, 앱 분류, 핵심 가치, 제약, 성공 기준
- `_workspace/01_plan.md`
  MVP 압축, 구현 단계, 재사용 산출물, 위험 요소
- `_workspace/02_build_log.md`
  실제 변경 사실, 검증 사실, Oshiz 특화 결정
- `_workspace/99_review.md`
  품질 리뷰, IP/브랜드 적합성, 잔여 위험, 다음 추천 행동
- `docs/references.json`
  선택적으로 로드할 외부 문서 레지스트리
- `projects/{project-name}/`
  실제 미니앱 프로젝트별 산출물

## 에이전트 역할

- `requirements-analyst`
  요청을 Oshiz 미니앱 관점으로 분류하고 계획을 만든다.
- `implementation-engineer`
  구현과 검증을 수행한다.
- `quality-reviewer`
  품질, 회귀, 검증 부족을 점검한다.
- `oshiz-brand-guardian`
  캐릭터/IP/세계관 일관성과 경험 톤을 점검한다.

## 완료 조건

- 분류 결과와 핵심 가치가 `_workspace/00_input.md`에 반영됨
- MVP 압축과 구현 단계가 `_workspace/01_plan.md`에 반영됨
- 변경 사실과 검증 사실이 `_workspace/02_build_log.md`에 반영됨
- 리뷰와 브랜드/IP 점검 결과가 `_workspace/99_review.md`에 반영됨
- `claude-progress.txt`에 최근 상태가 반영됨
