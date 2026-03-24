# Oshiz Mini App Harness Variant

이 폴더는 기본 하네스를 그대로 복제한 것이 아니라, Oshiz Mini App 운영 문맥에 맞게 파생된 전용 하네스입니다.

## 이 버전의 차이점

- Oshiz를 단순 챗봇이 아니라 AI 캐릭터 플랫폼으로 본다.
- 미니앱을 게임과 AI 채팅 사이의 `Life App` 경험으로 분류한다.
- 앱 기획 전에 `목적 / 복잡도 / 구현 형태`를 먼저 분류한다.
- 요청이 크면 `1일 MVP → 3일 MVP → 1주 MVP`로 스코프를 압축한다.
- 캐릭터 톤, 세계관, IP 일관성을 구현 품질의 일부로 본다.
- 결과물은 앱뿐 아니라 재사용 가능한 패턴과 문서까지 남겨야 한다.
- Notion 문서 레지스트리를 참조하되, 연결이 없어도 로컬 파일만으로 작업이 가능해야 한다.

## 구조

```text
.
├── CLAUDE.md
├── claude-progress.txt
├── .claude/
│   ├── agents/
│   ├── skills/
│   └── settings.json
├── _workspace/
│   ├── 00_input.md
│   ├── 01_plan.md
│   ├── 02_build_log.md
│   └── 99_review.md
├── docs/
│   ├── extracted-traits.md
│   └── references.json
├── projects/
├── scripts/
│   └── validate-workspace.ps1
└── src/
```

## 사용 흐름

1. 새 요청을 받으면 `miniapp-classifier` 또는 `project-harness` 스킬로 시작합니다.
2. `_workspace/00_input.md`에 앱 분류와 핵심 가치를 먼저 정리합니다.
3. `_workspace/01_plan.md`에서 MVP 압축과 재사용 산출물을 정리합니다.
4. 실제 앱 단위 작업은 `projects/` 아래에서 진행할 수 있습니다.
5. 완료 전에는 브랜드/IP 일관성까지 포함해 리뷰합니다.

## 출처

이 파생 버전은 `kiheonshin/harness-agent`의 `oshiz-miniapp-agent` branch에서 드러난 프로젝트 전용 규칙을 추출해 재구성한 것입니다.
