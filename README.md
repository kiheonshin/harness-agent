# Harness Agent

AI 에이전트의 행동을 **파일 기반 규칙**으로 제어하는 하네스(harness) 환경.

모델을 수정하는 대신, 모델이 작동하는 **환경과 규칙**을 설계하여 일관되고 재현 가능한 AI 작업을 구현한다.

## 핵심 아이디어

```
모델을 바꾸지 않는다. 모델이 움직이는 레일을 깐다.
```

- `CLAUDE.md` — 에이전트의 "헌법". 모든 행동 규칙을 정의
- `_workspace/*.md` — 작업 상태를 파일로 기록 (대화가 아니라 파일이 기억)
- `.claude/skills/` — 도메인 지식을 모듈화한 스킬 파일
- `.claude/agents/` — 역할별 에이전트 정의
- `claude-progress.txt` — 세션 간 연속성 보장

## 구조

```
.
├── CLAUDE.md                     ← 에이전트 행동 규칙
├── claude-progress.txt           ← 세션 간 상태 기록
├── .claude/
│   ├── agents/                   ← 역할별 에이전트
│   ├── skills/                   ← 도메인 지식 스킬
│   └── settings.json             ← 권한 및 안전 설정
├── _workspace/
│   ├── 00_input.md               ← 요청 정의
│   ├── 01_plan.md                ← 구현 계획
│   ├── 02_build_log.md           ← 작업 로그
│   └── 99_review.md              ← 품질 리뷰
├── docs/                         ← 참조 문서 레지스트리
├── projects/                     ← 프로젝트 산출물
├── scripts/                      ← 검증 스크립트
└── src/
```

## 사용 흐름

1. 요청을 받으면 `_workspace/00_input.md`에 정리
2. `_workspace/01_plan.md`에 구현 계획 수립
3. `projects/` 또는 `src/`에서 실제 구현
4. `_workspace/02_build_log.md`에 작업 기록
5. `_workspace/99_review.md`에 품질 검토
6. `scripts/validate-workspace.ps1`로 상태 검증

## 브랜치 전략

| 브랜치 | 역할 |
|--------|------|
| `master` | 범용 하네스 (도메인 무관) |
| `oshiz-miniapp-agent` | [오시즈 미니앱 플랫폼 전용 에이전트](https://github.com/kiheonshin/harness-agent/tree/oshiz-miniapp-agent) |

도메인별 전용 에이전트가 필요하면 `master`에서 브랜치를 만들고, 해당 도메인의 스킬과 규칙을 추가한다.

## 설계 원칙

- **파일이 기억이다** — 대화창이 아니라 프로젝트 폴더가 작업의 진짜 상태
- **규칙이 행동을 결정한다** — CLAUDE.md의 규칙을 바꾸면 에이전트의 행동이 바뀜
- **스킬은 선택적이다** — 필요한 도메인 지식만 로드
- **실패에서 배운다** — 문제가 발생하면 규칙을 보강 (하네스 튜닝)
