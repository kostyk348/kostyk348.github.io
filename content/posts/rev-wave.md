---
title: "Клеточный реверс без Ghidra"
date: 2026-08-17
tags:
    - "mime-os"
    - "reverse-engineering"
    - "rust"
---

# Клеточный реверс без Ghidra

Каждая функция бинарника — отдельный .eml: call-граф в заголовках,
типы распространяются волной по References с call-site dataflow.

```bash
emlbox rev game.exe cells          # objdump -> .eml-граф
emlbox rev wave cells net_send arg1 void* 3   # волна типов
emlbox rev diff cells_v1 cells_v2  # диффинг версий
```

LLM подключается через rev-mcp: читает только соседей клетки.
