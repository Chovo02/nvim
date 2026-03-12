# ⚡ NvChad - Configurazione Personale

Configurazione Neovim basata su [NvChad](https://nvchad.com) per sviluppo Python e workflow ottimizzato.

## Requisiti

- Neovim ≥ 0.9
- Git, ripgrep, fd
- Node.js (per LSP)
- Python 3

## Installazione

```bash
# Backup configurazione esistente
mv ~/.config/nvim ~/.config/nvim.backup

# Clone
git clone <repo-url> ~/.config/nvim

# Avvia Neovim (Lazy installerà automaticamente i plugin)
nvim
```

## Struttura

```
lua/
├── plugins/          # Plugin organizzati per categoria
│   ├── ai.lua       # AI assistants
│   ├── python.lua   # Python dev tools
│   ├── notebook.lua # Jupyter integration
│   ├── git.lua      # Git workflow
│   └── ...
├── configs/         # Configurazioni LSP, formatter
├── mappings.lua     # Keymaps personalizzati
└── options.lua      # Opzioni Neovim
```

## Keymaps

Vedi [KEYMAP.md](./KEYMAP.md) per la lista completa delle scorciatoie.

---

_Configurazione personale - liberamente ispirata da [LazyVim starter](https://github.com/LazyVim/starter)_
