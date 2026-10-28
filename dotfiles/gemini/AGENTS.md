# Global Agent Instructions

## Operating Environment
- Primary OS: Linux (Debian)
- Shell: Zsh (with Ghostty / Starship prompt)
- Language Runtimes: Python, Go, Node.js (managed via `mise`)

## General Workflow Guidelines
- **Internal vs User Files:**
  - Agent-internal temporary data, scratchpad scripts, and raw dumps belong in `ai/`.
  - Human-readable documentation, summaries, and user guides belong in `docs/`.
- **Task Tracking:**
  - Track multi-step tasks in `ai/todo.md`.
- **Reproducibility:**
  - Dotfiles and system configurations belong in `syncthing/vagrant/ops/desktop-setup/debianDesktopConfig` and are managed via Ansible playbooks.
