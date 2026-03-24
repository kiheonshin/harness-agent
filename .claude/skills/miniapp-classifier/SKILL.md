---
name: miniapp-classifier
description: Oshiz Mini App 요청을 목적, 복잡도, 구현 형태로 분류하고 MVP 압축안을 제안하는 분류 스킬.
---
# Miniapp Classifier

이 스킬은 계획 전에 요청을 올바른 미니앱 형태로 해석하기 위해 사용한다.

## 분류 축

- Purpose: `acquisition`, `experiment`, `ip-extension`, `community`, `internal-demo`
- Complexity: `lite`, `standard`, `heavy`
- Implementation shape: `frontend-only`, `stub-backend`, `real-backend`

## 출력 규칙

아래 형식으로 `_workspace/00_input.md`와 `_workspace/01_plan.md`에 반영할 수 있는 요약을 만든다.

1. 분류 결과
2. 왜 그렇게 판단했는지
3. 1일 MVP
4. 3일 MVP
5. 1주 MVP
6. 메인 Oshiz 플랫폼 연결 포인트
7. IP/캐릭터 일관성에서 주의할 점
