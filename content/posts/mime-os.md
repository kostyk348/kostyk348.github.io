---
title: "MIME-OS: one file for everything"
date: 2026-08-17
tags:
    - "mime-os"
    - "rust"
    - "local-first"
---

# MIME-OS: one file for everything

MIME-OS turns an .eml container into a universal storage format: a database,
an app, an agent's memory, even a game — a single file with a hash chain and
an append-only delta log.

**What works today (v0.5):**

- single-file container: mmap reader, two-level index, delta log with sha256 chain
- KV tables, tag database (eml-tag), EML-FS, IPC bus with a runner
- network delta-sync: per-writer chains, LWW merge, TCP P2P, SMTP bridge (letters)
- X-Encoding: deflate and aes-256-gcm — the whole database can be encrypted
- cellular reverse engineering without Ghidra: objdump -> .eml function graph,
  type waves
- egui viewer (GUI)

**Why .eml?** One format for disk, memory and network — data never changes
shape. The hash chain gives integrity and versioning, deltas give sync between
devices, letters give mail transport without servers.

This site is built from .eml posts: each entry is a container with headers and
a markdown body. Updating is a single command: `./update.sh`.
