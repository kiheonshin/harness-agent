---
name: workspace-audit
description: 하네스 워크스페이스를 점검하고, 누락 파일, 남아 있는 플레이스홀더, 다음 수정 행동을 요약하는 점검 스킬.
disable-model-invocation: true
allowed-tools: Bash(powershell *)
---
# Workspace Audit

핸드오프 전에 빠르게 현재 상태를 확인하고 싶을 때 이 스킬을 사용한다.

## 명령

```bash
powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}/../../../scripts/validate-workspace.ps1"
```

## 결과 해석 방법

1. 파일이 빠져 있으면 계속 진행하기 전에 먼저 생성한다.
2. 플레이스홀더가 남아 있으면 해당 워크스페이스 문서를 갱신한다.
3. 구조적으로 완전하면 다음 구현 또는 리뷰 행동을 한국어로 요약한다.
