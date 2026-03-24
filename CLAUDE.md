# Harness Project Memory

이 프로젝트는 빈 앱 저장소가 아니라 작업 하네스에서 시작한다.
모든 구현은 `_workspace` 상태 문서와 함께 움직여야 한다.

## 기본 목표

- 사용자 요청을 한국어로 명확히 정리한다.
- 구현 전에 계획을 남긴다.
- 구현 중에는 사실 기반 로그를 남긴다.
- 종료 전에는 리뷰와 검증 결과를 남긴다.

## 세션 시작 순서

1. `README.md`를 읽어 현재 폴더 구조를 이해한다.
2. `_workspace/00_input.md`를 읽어 현재 요청과 제약을 파악한다.
3. `_workspace/01_plan.md`를 읽어 진행 계획과 상태를 파악한다.
4. `_workspace/02_build_log.md`를 읽어 최근 작업 사실을 파악한다.
5. `_workspace/99_review.md`를 읽어 최근 리뷰 결과와 잔여 리스크를 파악한다.
6. 위 다섯 파일을 바탕으로 현재 상태와 다음 할 일을 한국어로 짧게 요약한다.

## 작업 원칙

- 구현 전에 먼저 `_workspace/00_input.md`와 `_workspace/01_plan.md`를 최신 상태로 만든다.
- 한 번에 하나의 작은 구현 덩어리만 끝낸다.
- 의미 있는 수정이 끝날 때마다 `_workspace/02_build_log.md`를 갱신한다.
- 사용자에게 넘기기 전 `_workspace/99_review.md`를 갱신한다.
- 종료 전에 `scripts/validate-workspace.ps1`를 실행해 필수 파일 누락이 없는지 본다.
- 사용자 커뮤니케이션은 한국어로, 설명은 짧고 명확하게 한다.

## 파일 계약

- `_workspace/00_input.md`
  현재 요청, 범위, 제약, 성공 조건
- `_workspace/01_plan.md`
  선택한 접근 방식, 단계, 진행 상태, 위험 요소
- `_workspace/02_build_log.md`
  실제로 한 작업과 검증 사실
- `_workspace/99_review.md`
  최종 점검, 남은 위험, 다음 추천 행동

## 에이전트 역할

- `requirements-analyst`
  요청을 구조화하고 작업 범위와 계획을 만든다.
- `implementation-engineer`
  실제 파일을 수정하고 검증을 수행한다.
- `quality-reviewer`
  결과를 점검하고 누락, 회귀, 잔여 위험을 정리한다.

## 완료 조건

다음 항목이 모두 충족되면 해당 작업 배치는 완료로 본다.

- 요청과 제약이 `_workspace/00_input.md`에 반영됨
- 구현 계획이 `_workspace/01_plan.md`에 반영됨
- 변경 사실과 검증 사실이 `_workspace/02_build_log.md`에 남음
- 리뷰 결과와 잔여 위험이 `_workspace/99_review.md`에 남음
