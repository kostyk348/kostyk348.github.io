---
title: "Projects"
description: "My open-source projects"
---

All of my repositories are experiments rather than finished products — I enjoy exploring unconventional ideas and learning how complex systems work from the inside.

---

## MIME-OS Ecosystem

### 📦 mime-os
**MIME-OS / EMLBox** — single-file `.eml` container OS stack. One format for disk, memory and network: mmap reader, two-level index, append-only delta log with sha256 hash-chain, KV tables, IPC bus with a logic runner, tagged flat FS, network delta-sync (per-writer chains, LWW), TCP P2P, SMTP bridge, X-Encoding (deflate + aes-256-gcm), cellular reverse engineering without Ghidra (type waves, call-site dataflow), egui viewer, MCP server for LLMs.  
`Rust` `local-first` `MIME` `delta-sync` `reverse-engineering`

[View on GitHub](https://github.com/kostyk348/mime-os)

### 🏭 eml-scada
**EML-SCADA** — SCADA stack built on mime-os: historian (tagdb), alarms with hash-chain, station container, controller-to-controller MIME IPC, NiceGUI HMI. Everything is `.eml`.  
`Python` `SCADA` `MIME-OS` `industrial`

[View on GitHub](https://github.com/kostyk348/eml-scada)

### 🛰️ capsuleos
**CapsuleOS** — zero-database, pure-MIME multimodal workspace & personal knowledge engine. Native desktop (Tauri + React 19).  
`TypeScript` `Rust` `Tauri` `MIME`

[View on GitHub](https://github.com/kostyk348/capsuleos)

### 📖 chronicle-engine
**Chronicle Engine (Campfire Scribe)** — multimodal asynchronous TTRPG platform: RFC 5322 EML zero-DB, WEGO tactical resolver, book typesetting, audio plays. Native desktop (Tauri + React 19).  
`TypeScript` `Rust` `Tauri` `TTRPG`

[View on GitHub](https://github.com/kostyk348/chronicle-engine)

### 🧰 MIME-OS utilities
Small daily tools on emlbox: **track** (time tracker), **tcol** (folderless tagged file collection), **bm** (bookmarks), **cash** (expense tracker), **backup** (directory snapshots). Each is a single-file `.eml` store.  
`Rust` `MIME-OS` `local-first`

[bm](https://github.com/kostyk348/bm) · [cash](https://github.com/kostyk348/cash) · [backup](https://github.com/kostyk348/backup) · [track](https://github.com/kostyk348/track) · [tcol](https://github.com/kostyk348/tcol)

---

## Performance & Low-Level

### ⚡ g-tools
**Zero-copy dataflow DAG engine**: mmap → lock-free chunks → SIMD (AVX2) → flat arena → C-ABI. `grep` 7.7× faster, `strings` 10× faster. RE-analysis nodes + FastMCP server (10 tools).  
`Rust` `SIMD` `AVX2` `zero-copy` `dataflow`

[View on GitHub](https://github.com/kostyk348/g-tools)

### 🔢 MPTC
**Multi-Phase Ternary Computing** — branchless fixed-point C99 library for ultra-low-power embedded MCUs. Sliding DFT, balanced ternary, bitonic sorting networks.  
`C99` `DSP` `embedded` `fixed-point`

[View on GitHub](https://github.com/kostyk348/MPTC)

### 🕹️ libatme
**Pure-C, zero-dependency Type 1 / PFB font rasterizer** ported from the algorithms behind Adobe Type Manager (ATM) Deluxe 4.1. 16.16 fixed-point math, AET rasterization, LRU glyph cache. Up to 3.9× faster than FreeType for Type 1 outlines.  
`C` `font-rasterizer` `Type1`

[View on GitHub](https://github.com/kostyk348/libatme)

### 🖼️ fca
**libfca** — fuzzy cellular-rule 2× upscaler for old video/anime: scale2x/fuzzy/xbr rules, AVX2, temporal tile cache, GLSL mpv shaders.  
`C` `upscaling` `AVX2` `mpv`

[View on GitHub](https://github.com/kostyk348/fca)

---

## Real-Time Systems & Control

### ⚙️ DSO-Controllab
Research prototype for **Deterministic Systems Optimization**: verified execution plans and resource contracts for control systems. Tests PID / LQR / MPC / DSO controllers against random second-order plants.  
`Python` `control-systems` `research`

[View on GitHub](https://github.com/kostyk348/DSO-Controllab)

### 🔧 DSO-TRON
Deterministic real-time OS kernel inspired by ITRON 4.0. Static allocation, lock-free SPSC FIFO, time-triggered scheduling. Hard real-time / embedded.  
`C` `Assembly` `RTOS` `kernel`

[View on GitHub](https://github.com/kostyk348/DSO-TRON)

### 🏠 homeo
Homeostatic controller on invariants: Adam relaxation + thermal noise (port of the C++ CIDHC).  
`Python` `control-systems`

[View on GitHub](https://github.com/kostyk348/homeo)

---

## Databases & Storage

### 🗄️ eafar-db
**EAFAR-DB** — database built on the EAFAR paradigm (Everything is a Field, Archive, Replay). C++20 embedded DB with sparse pages, lazy views, fuzzy queries, time-travel replay via `replay_at()`. 78 core + 64 DB tests, all green.  
`C++20` `embedded` `time-travel`

[View on GitHub](https://github.com/kostyk348/eafar-db)

---

## AI & Agents

### 🧠 SINT
**SINT: Agent Architecture Manifesto** — agents as systems, not chatbots with tools. 7 cognitive layers, semantic registers, provenance protocol. Plus a whole family of MCP servers: `sint-re-graph-mcp` (semantic binary graph), `sint-ua-v2.1` (hash-chain memory), `sint-spec-mcp`, `sint-self-mcp`, `sint-working-mcp` and more.  
`agents` `MCP` `architecture`

[Manifesto](https://github.com/kostyk348/sint-manifesto) · [re-graph](https://github.com/kostyk348/sint-re-graph-mcp) · [sint-ua](https://github.com/kostyk348/sint-ua-v2.1)

### 🧮 zeta_applied
Applied Riemann zeta / Dirichlet L-function toolkit for ML, DNA spectral screening, binary decompilation, cryptography, graphics, and forward-mode autodiff. Spectral classifiers (97.6%), DNA SNP retrieval (99.6% top-1), WASM micro-assembler.  
`Python` `mathematics` `cryptography`

[View on GitHub](https://github.com/kostyk348/zeta_applied)

### 🏆 kaggriculture
Kaggriculture — Kaggle simulation with a fuzzy/hard-register agent stack.  
`Python` `agents` `simulation`

[View on GitHub](https://github.com/kostyk348/kaggriculture)

---

## Tooling & Input

### 📄 pdf-translate
**Layout-preserving PDF translation** — Chinese→Russian, English→Russian, 30+ languages. DeepLX backend, no API key. Every line keeps its exact position and rotation.  
`Python` `PyMuPDF` `DeepL`

[View on GitHub](https://github.com/kostyk348/pdf-translate)

### 🎹 DSO Layout
**Colemak-DH + Optimized Russian** ergonomic keyboard layout. Simulated annealing optimizer (97.65% coverage), 47% less finger travel, 63% fewer same-finger bigrams vs QWERTY+ЙЦУКЕН. Navigation layer with CapsLock.  
`keyboard-layout` `ergonomics`

[View on GitHub](https://github.com/kostyk348/dso-layout)

---

## Web Applications

### 🌐 v0-prometheus-nexus-flow
Hyperdimensional semantic browser inspired by Ted Nelson's Project Xanadu: lens-filtered hypergraphs, bidirectional links, transclusion, version control, 3D spatial navigation, P2P sharing.  
`TypeScript` `Next.js` `Xanadu`

[View on GitHub](https://github.com/kostyk348/v0-prometheus-nexus-flow)

---

## Education

### 🧠 NeuroSchool-Profkom-LETI
AI content generation course for NeuroSchool at LETI university — 10 modules: image, music, video, storytelling, design, gaming, AI agents, social media, education, ethics.  
`Python` `education` `AI`

[View on GitHub](https://github.com/kostyk348/NeuroSchool-Profkom-LETI)
