---
title: "Cellular reverse engineering without Ghidra"
date: 2026-08-17
tags:
    - "mime-os"
    - "reverse-engineering"
    - "rust"
---

# Cellular reverse engineering without Ghidra

Each function of a binary becomes its own .eml cell: the call graph lives in
headers, types propagate as a wave over References with call-site dataflow.

```bash
emlbox rev game.exe cells          # objdump -> .eml function graph
emlbox rev wave cells net_send arg1 void* 3   # type wave
emlbox rev diff cells_v1 cells_v2  # version diffing
```

LLMs connect through rev-mcp: they read only the neighbours of a cell, not the
whole disassembly — a point-wise context instead of a 500MB dump.
