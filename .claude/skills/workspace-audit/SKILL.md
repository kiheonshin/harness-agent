---
name: workspace-audit
description: Oshiz Mini App 하네스 구조와 워크스페이스 문서를 점검하고, 누락 사항과 다음 수정 행동을 요약하는 점검 스킬.
disable-model-invocation: true
allowed-tools: Bash(powershell *)
---
# Workspace Audit

핸드오프 전에 현재 하네스 상태를 빠르게 점검할 때 사용한다.

## 명령

```bash
powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}/../../../scripts/validate-workspace.ps1"
```

## 결과 해석

1. 필수 파일이 빠져 있으면 먼저 생성한다.
2. 플레이스홀더가 남아 있으면 해당 문서를 갱신한다.
3. 구조가 완전하면 다음 구현 또는 리뷰 행동을 한국어로 요약한다.
