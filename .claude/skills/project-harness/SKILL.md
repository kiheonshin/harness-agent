---
name: project-harness
description: 이 프로젝트 하네스에서 작업을 시작하거나 이어갈 때 쓰는 오케스트레이터 스킬. 사용자가 구현, 계속 진행, 현재 상태 점검을 요청할 때 사용한다.
---
# Project Harness

이 스킬은 대화 기억에만 의존하지 않고, 파일 기반 워크플로로 작업을 진행하기 위해 사용한다.

## 필수 루프

1. `README.md`와 `CLAUDE.md`를 읽는다.
2. 결정을 내리기 전에 `_workspace/*.md` 파일을 모두 읽는다.
3. 요청이 새롭거나 바뀌었으면 먼저 `requirements-analyst`를 사용한다.
4. 코드 수정 전에 `_workspace/00_input.md`와 `_workspace/01_plan.md`가 최신 상태인지 확인한다.
5. 실제 파일 변경과 검증은 `implementation-engineer`를 사용한다.
6. 사용자에게 넘기기 전에 `quality-reviewer`를 사용한다.
7. 마무리 전에 `powershell -ExecutionPolicy Bypass -File scripts/validate-workspace.ps1`를 실행한다.
8. 결과, 검증, 다음 행동을 한국어로 요약한다.

## 파일 계약

- `_workspace/00_input.md`는 현재 작업 브리프다.
- `_workspace/01_plan.md`는 활성 구현 계획이다.
- `_workspace/02_build_log.md`는 사실 기반 실행 로그다.
- `_workspace/99_review.md`는 핸드오프용 리뷰 문서다.

## 완료 조건

네 개의 워크스페이스 파일이 모두 최신 상태를 반영하지 않으면 작업을 완료로 보지 않는다.
