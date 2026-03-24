# Harness Agent Project

이 폴더는 아직 앱이 아니라 하네스입니다.

목표는 자연어 요청을 바로 코드 작업으로 밀어 넣지 않고, 아래 네 가지를 먼저 고정하는 것입니다.

1. 어떤 요청을 받았는지
2. 어떤 순서로 진행할지
3. 지금까지 무엇을 만들었는지
4. 마지막에 무엇을 검토했는지

## 구조

```text
.
├── CLAUDE.md
├── .claude/
│   ├── agents/
│   ├── skills/
│   └── settings.json
├── _workspace/
│   ├── 00_input.md
│   ├── 01_plan.md
│   ├── 02_build_log.md
│   └── 99_review.md
├── scripts/
│   └── validate-workspace.ps1
└── src/
```

## 빠른 사용 흐름

1. 사용자 요청을 받으면 `project-harness` 스킬로 시작합니다.
2. `_workspace/00_input.md`에 요청과 제약을 정리합니다.
3. `_workspace/01_plan.md`에 구현 계획을 적습니다.
4. 실제 구현은 `src/`에 진행합니다.
5. 작업 로그는 `_workspace/02_build_log.md`에 남깁니다.
6. 마지막 검토는 `_workspace/99_review.md`에 남깁니다.
7. 마무리 전에 `scripts/validate-workspace.ps1`로 상태를 검사합니다.

## 의도

이 구조는 모델이 "대충 기억하는 것" 대신 파일을 상태 저장소처럼 쓰게 만듭니다.
즉, 대화창이 아니라 프로젝트 폴더가 작업의 진짜 기억이 됩니다.
