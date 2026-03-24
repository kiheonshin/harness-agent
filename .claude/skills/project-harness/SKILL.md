---
name: project-harness
description: Oshiz Mini App 전용 오케스트레이터 스킬. 새 미니앱 기획, 계속 진행, 현재 상태 점검 요청에 사용한다.
---
# Project Harness

이 스킬은 Oshiz Mini App 작업을 파일 기반 워크플로와 도메인 규칙 안에서 진행하기 위해 사용한다.

## 필수 루프

1. `README.md`, `CLAUDE.md`, `claude-progress.txt`를 읽는다.
2. `_workspace/*.md`를 모두 읽는다.
3. 새 요청이거나 범위가 바뀌었으면 먼저 `requirements-analyst`를 사용한다.
4. 필요하면 `miniapp-classifier` 스킬로 목적, 복잡도, 구현 형태를 정리한다.
5. 구현 전 `_workspace/00_input.md`와 `_workspace/01_plan.md`를 최신 상태로 만든다.
6. 실제 구현과 검증은 `implementation-engineer`가 수행한다.
7. 핸드오프 전 `quality-reviewer`와 `oshiz-brand-guardian`을 사용한다.
8. 마무리 전 `powershell -ExecutionPolicy Bypass -File scripts/validate-workspace.ps1`를 실행한다.
9. 결과, 검증, Oshiz 관점의 적합성, 다음 행동을 한국어로 요약한다.

## 완료 조건

- 앱 분류가 기록됨
- MVP 압축이 기록됨
- 빌드 로그와 리뷰가 최신 상태임
- 진행 상태가 `claude-progress.txt`에 반영됨
