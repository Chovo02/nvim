# 🎹 NvChad Python Dev Environment - Keybindings Reference

> Complete reference of all keyboard shortcuts for your Neovim configuration

---

## 📋 Table of Contents

- [Basic (General)](#basic-general)
- [NvChad Base](#nvchad-base)
- [Python Development](#python-development)
- [AI & Autocomplete](#ai--autocomplete)
- [Testing](#testing)
- [Debugging](#debugging)
- [Git](#git)
- [Jupyter Notebooks](#jupyter-notebooks)
- [Diagnostics & LSP](#diagnostics--lsp)
- [UI & Tools](#ui--tools)
- [Snacks.nvim](#snacksnvim)
- [Noice.nvim](#noicenvim)
- [Todo Comments](#todo-comments)

---

## ⌨️ Legend

- `<leader>` = `Space` key
- `n` = Normal mode
- `i` = Insert mode
- `v` = Visual mode
- `c` = Command mode
- `<S-...>` = Shift + key
- `<C-...>` = Ctrl + key
- `<A-...>` = Alt + key
- `<F...>` = Function keys (F1-F12)

---

## 🔰 Basic (General)

| Key | Mode | Description |
|-----|------|-------------|
| `;` | n | Enter command mode (same as `:`) |
| `jk` | i | Exit insert mode (escape) |
| `<leader>w` | n | Save file |
| `<leader>q` | n | Quit |
| `<leader>h` | n | Clear search highlight |
| `<leader>ch` | n | Copy file path to clipboard |
| `<leader>fm` | n | Format file |

---

## 🏗️ NvChad Base

### File Operations

| Key | Mode | Description |
|-----|------|-------------|
| `<C-s>` | n,i,v | Save file |
| `<C-c>` | n | Copy entire file to clipboard |
| `<leader>rn` | n | Rename file |
| `<leader>/` | n | Toggle comment (line) |
| `gcc` | n | Toggle comment (line) |
| `gc` | v | Toggle comment (selection) |

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `j` | n | Move down (respects wrap) |
| `k` | n | Move up (respects wrap) |
| `<C-h>` | n | Window left |
| `<C-j>` | n | Window down |
| `<C-k>` | n | Window up |
| `<C-l>` | n | Window right |
| `<C-d>` | n | Scroll down (half page) |
| `<C-u>` | n | Scroll up (half page) |

### Buffer Management

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<leader>x` | n | Close buffer |
| `<leader>b` | n | List buffers (Telescope) |
| `<leader>bb` | n | Switch buffers |
| `<leader>bn` | n | New buffer |

### Telescope (Finder)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | n | Find files |
| `<leader>fa` | n | Find all files (including hidden) |
| `<leader>fw` | n | Find word (live grep) |
| `<leader>fb` | n | Find buffers |
| `<leader>fh` | n | Find help |
| `<leader>fo` | n | Find old files |
| `<leader>fz` | n | Find in current buffer |
| `<leader>cm` | n | Find git commits |
| `<leader>gt` | n | Find git status |
| `<leader>pt` | n | Find projects |
| `<leader>ma` | n | Find marks |
| `<leader>th` | n | Find themes |

### Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>v` | n | New vertical terminal |
| `<leader>h` | n | New horizontal terminal |
| `<A-v>` | n | Toggle vertical terminal |
| `<A-h>` | n | Toggle horizontal terminal |
| `<A-i>` | n | Toggle floating terminal |
| `<Esc><Esc>` | t | Exit terminal mode |

### LSP (Base)

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Go to references |
| `K` | n | Hover documentation |
| `<leader>ca` | n | Code action |
| `<leader>ra` | n | Rename |
| `<leader>f` | n | Format document |
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `<leader>ds` | n | Document symbols |
| `<leader>ws` | n | Workspace symbols |

### NvimTree (File Explorer)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-n>` | n | Toggle NvimTree |
| `<leader>e` | n | Focus NvimTree |

### Gitsigns (Base)

| Key | Mode | Description |
|-----|------|-------------|
| `]c` | n | Next git hunk |
| `[c` | n | Previous git hunk |
| `<leader>hs` | n | Stage hunk |
| `<leader>hr` | n | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff this |

---

## 🐍 Python Development

### Virtual Environment

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>vs` | n | **Select virtual environment** |
| `<leader>vc` | n | **Select cached virtual environment** |

---

## 🤖 AI & Autocomplete

### Supermaven (AI Autocomplete)

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | i | **Accept full suggestion** |
| `<C-j>` | i | **Accept word** |
| `<C-]>` | i | **Clear suggestion** |

### Opencode (AI Agent)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ai` | n | **Opencode: Open chat** |
| `<leader>ac` | n,v | **Opencode: Ask with selection** |
| `<leader>ag` | n | **Opencode: Git review** |
| `<leader>af` | n | **Opencode: Fix code** |
| `<leader>ae` | n | **Opencode: Explain code** |
| `<leader>ad` | n | **Opencode: Generate docs** |

---

## 🧪 Testing

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tt` | n | **Test: Run nearest** |
| `<leader>tT` | n | **Test: Run file** |
| `<leader>ts` | n | **Test: Toggle summary window** |
| `<leader>to` | n | **Test: Show output** |
| `<leader>tO` | n | **Test: Toggle output panel** |
| `<leader>td` | n | **Test: Debug nearest test** |
| `<leader>tS` | n | **Test: Stop test run** |
| `<leader>ta` | n | **Test: Attach to test** |
| `<leader>tc` | n | **Test: Show coverage** |
| `<leader>tC` | n | **Test: Clear coverage** |
| `<leader>tl` | n | **Test: Load coverage data** |

---

## 🐛 Debugging

| Key | Mode | Description |
|-----|------|-------------|
| `<F5>` | n | **Debug: Start/Continue** |
| `<F10>` | n | **Debug: Step over** |
| `<F11>` | n | **Debug: Step into** |
| `<F12>` | n | **Debug: Step out** |
| `<leader>db` | n | **Debug: Toggle breakpoint** |
| `<leader>dB` | n | **Debug: Conditional breakpoint** |
| `<leader>du` | n | **Debug: Toggle DAP UI** |
| `<leader>dt` | n | **Debug: Terminate** |
| `<leader>dr` | n | **Debug: Toggle REPL** |
| `<leader>dl` | n | **Debug: Run last** |
| `<leader>dp` | n | **Debug: Test method (pytest)** |
| `<leader>dP` | n | **Debug: Test class (pytest)** |

---

## 🔀 Git

### Lazygit (ToggleTerm)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | n | **Toggle LazyGit** |
| `<leader>gG` | n | **Lazygit (via Snacks)** |
| `<leader>gf` | n | **Lazygit: Current file history** |
| `<leader>gl` | n | **Lazygit: Log (cwd)** |

### Neogit (Magit-style Interface)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gn` | n | **Neogit: Open** |
| `<leader>gc` | n | **Neogit: Commit** |
| `<leader>gp` | n | **Neogit: Push** |
| `<leader>gl` | n | **Neogit: Pull** |
| `<leader>gb` | n | **Neogit: Branch manager** |

### Diffview

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gd` | n | **Diffview: Open** |
| `<leader>gq` | n | **Diffview: Close** |
| `<leader>gh` | n | **Diffview: File history** |
| `<leader>gf` | n | **Diffview: Current file history** |
| `<leader>gt` | n | **Diffview: Toggle files panel** |

---

## 📓 Jupyter Notebooks (Molten)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mi` | n | **Molten: Initialize kernel** |
| `<leader>mr` | n | **Molten: Run current cell** |
| `<leader>mv` | v | **Molten: Run visual selection** |
| `<leader>mo` | n | **Molten: Enter output window** |
| `<leader>mh` | n | **Molten: Hide output** |
| `<leader>md` | n | **Molten: Delete cell** |
| `<leader>mc` | n | **Molten: Change cell type** |
| `<leader>mn` | n | **Molten: Next cell** |
| `<leader>mp` | n | **Molten: Previous cell** |
| `<leader>ms` | n | **Molten: Restart kernel** |

---

## 🔍 Diagnostics & LSP

### Trouble.nvim

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | n | **Trouble: Diagnostics (all)** |
| `<leader>xX` | n | **Trouble: Diagnostics (buffer)** |
| `<leader>xl` | n | **Trouble: Location list** |
| `<leader>xq` | n | **Trouble: Quickfix** |
| `<leader>xr` | n | **Trouble: LSP references** |
| `<leader>xs` | n | **Trouble: Symbols** |
| `<leader>xt` | n | **Trouble: Todo comments** |
| `<leader>xw` | n | **Trouble: Workspace diagnostics** |

---

## 🛠️ UI & Tools

### ToggleTerm

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tt` | n | **Toggle floating terminal** |
| `<leader>th` | n | **Toggle horizontal terminal** |
| `<leader>tv` | n | **Toggle vertical terminal** |
| `<C-\>` | n,i | **Toggle terminal** |

### Overseer (Task Runner)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>or` | n | **Overseer: Run task** |
| `<leader>ot` | n | **Overseer: Toggle panel** |
| `<leader>ob` | n | **Overseer: Build** |
| `<leader>oc` | n | **Overseer: Quick action** |
| `<leader>oa` | n | **Overseer: Task action** |

### LazyDocker

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ld` | n | **Toggle LazyDocker** |

---

## 🍿 Snacks.nvim

### Zen Mode

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>z` | n | **Toggle Zen Mode** |
| `<leader>Z` | n | **Toggle Zoom Mode** |

### Buffer Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>bd` | n | **Delete buffer** |
| `<leader>bD` | n | **Delete other buffers** |

### Notifications

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>n` | n | **Show notification history** |
| `<leader>un` | n | **Hide all notifications** |

### Dashboard

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ud` | n | **Open dashboard** |

---

## 💥 Noice.nvim

| Key | Mode | Description |
|-----|------|-------------|
| `<S-Enter>` | c | **Redirect cmdline** |
| `<leader>nl` | n | **Noice: Last message** |
| `<leader>nh` | n | **Noice: History** |
| `<leader>na` | n | **Noice: All messages** |
| `<leader>nd` | n | **Noice: Dismiss all** |
| `<C-f>` | n,i,s | **Scroll forward (LSP)** |
| `<C-b>` | n,i,s | **Scroll backward (LSP)** |

---

## ✅ Todo Comments

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `]t` | n | **Next todo comment** |
| `[t` | n | **Previous todo comment** |

### Commands

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>td` | n | **Todo (Trouble)** |
| `<leader>tD` | n | **Todo/Fix/Fixme (Trouble)** |
| `<leader>ft` | n | **Find Todo (Telescope)** |
| `<leader>fT` | n | **Find Todo/Fix/Fixme** |

---

## 🎨 Which-Key Help

Press `<leader>` and wait 1 second to see a popup with all available keybindings for that prefix!

Or use `:WhichKey` to explore all mappings interactively.

---

## 📝 Tips

1. **Use Which-Key**: Press `<leader>` and pause to see all available commands
2. **Find your way**: Use `<leader>f` prefix for all Telescope finders
3. **Git workflow**: Use `<leader>g` prefix for all git operations
4. **Testing**: Use `<leader>t` prefix for test operations
5. **Diagnostics**: Use `<leader>x` prefix for Trouble/diagnostics
6. **Python**: Use `<leader>v` for virtualenv, `<leader>m` for molten

---

## 🔧 Customization

To add or modify keybindings, edit:
- Custom mappings: `~/.config/nvim/lua/mappings.lua`
- NvChad defaults: Check `~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua`

---

**Last Updated**: 2026-03-12
**Configuration**: NvChad v2.5 + Python Dev Environment
