<div align="center">
  <h1>Nvim Config</h1>
  <a href="https://github.com/neovim/neovim/releases/tag/stable">
    <img 
      src="https://img.shields.io/badge/Neovim-0.8.0-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" 
      alt="Neovim minimum version"/>
  </a>
  <a>
    <img 
      src="https://img.shields.io/github/languages/code-size/maxkopitz/nvim-config" 
      alt="Repository code size" />
  </a>
  <a href="https://github.com/maxkopitz/nvim-config/">
    <img 
      src="https://img.shields.io/github/issues/maxkopitz/nvim-config" 
      alt="Respository count of issues open" />
  </a>
  <a>
    <img 
      src="https://img.shields.io/github/stars/maxkopitz/nvim-config" 
      alt="Repository count of stars" />
  </a>
</div>

# Table of Contents 
- [About](#about)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Installation](#installation)
- [Installed Plugins](#installed-plugins)
    - [Installed LSP Servers](#installed-lsp-servers)
- [Key Mappings](#key-mappings)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [Inspirations](#inspirations)


# About 

The contents of this repo is the neovim config I use daily.

# Getting Started 
### Requirements
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
### Installation

``` bash
wget https://github.com/maxkopitz/nvim-config/archive/master.zip

```

# Installed Plugins 

- Plugin Manager [Packer.nvim](https://github.com/wbthomason/packer.nvim).
- Speed up loading Lua Modules [impatient.nvim](https://github.com/lewis6991/impatient.nvim).
- Tabs, as understood by any other editor [barbar.nvim](https://github.com/akinsho/bufferline.nvim).
- Fancy Fastest Async Start Screen Plugin of Neovim [dashboard-nvim](https://github.com/glepnir/dashboard-nvim).
- NeoVim statusline [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- File Explorer For Neovim [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua).
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons).
- Autopair plugin [nvim-autoapirs](https://github.com/windwp/nvim-autopairs).
- Fuzzy finder [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Pretty Notify [nvim-notify](https://github.com/rcarriga/nvim-notify).
- Better escaping [better-escape.vim](https://github.com/nvim-zh/better-escape.vim).
- View and search LSP symbols [Vista.vim](https://github.com/liuchengxu/vista.vim).
- Neoscroll [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim).
- util for tmux conf [tmux.vim](https://github.com/tmux-plugins/vim-tmux).
- Git fugititive [vim-fugitive](https://github.com/tpope/vim-fugitive).
- Get around fast [hoop.nvim](https://github.com/phaazon/hop.nvim).
- Auto complete engine [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp).
- [cmp-path](https://github.com/hrsh7th/cmp-path).
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer).
- [cmp-omni](https://github.com/hrsh7th/cmp-omni).
- [cmp-nvim-ultisnips](https://github.com/quangnguyen30192/cmp-nvim-ultisnips).
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji).
- vscode-like pictograms to LSP [lsp-kind](https://github.com/onsails/lspkind.nvim).
- [nvim-hls](https://github.com/kevinhwang91/nvim-hlslens#minimal-configuration)

### Installed [LSP](https://microsoft.github.io/language-server-protocol/) servers 
- [lua-lanuage-server](https://github.com/sumneko/lua-language-server).
- [vim-lanauge-server](https://github.com/iamcco/vim-language-server).
- [bash-lanauage-server](https://github.com/bash-lsp/bash-language-server)
- [clangd](https://clangd.llvm.org/installation.html).

# Key Mappings
``` lua 
-- Edit leader in lua/core/globals.lua:45
vim.g.mapleader =  ',' -- My leader key
```

<details><summary>General Mappings</summary>

### General Mappings 
```lua
-- Can be found in lua/core/mappings.lua
```

| Shortcut       | Mode(s) | Description |
| --------       | ----    | -----  |
| `;`            | Normal  | Maps `;` to `:`, no longer need to press shift to enter command mode. |
| `<leader>Q`    | Normal  | Quits nvim    |
| `<leader>w`    | Normal  | Saves buffer   | 
| `<leader>q`    | Normal  | Saves file if modified and quit | 
| `\d`           | Normal  | Deletes buffer, without closing window |
| `<Left>`       | Normal  | Switch window left | 
| `<Right>`      | Normal  | Switch window right | 
| `<Up>`         | Normal  | Switch window up | 
| `<Down>`       | Normal  | Switch window down | 
| `<C-A>`        | Insert  | Go to start of current line |
| `<C-E>`        | Insert  | Go to end of current line |
| `jk`           | Insert  | Return to Normal mode | 
| `<leader>\`    | Normal  | Splits current buffer |
| `<leader>sv`   | Normal  | Reload nvim config |
| `<leader>cb`   | Normal  | Blinks cursor, use if lost |

</details>

<details><summary>Bufferline Mappings</summary>

### Bufferline mappings 
```lua
-- Can be found in lua/core/mappings.lua
```
| Shortcut      | Mode(s) | Description |
| --------      | ----    | -----  |
| `<Tab>bb`     | Normal  | Pick a buffer to switch |
| `<Tab>bc`     | Normal  | Pick a buffer to close |
| `<Tab>bn`     | Normal  | Move to next buffer | 
| `<Tab>bp`     | Normal  | Move to previous buffer  |
| `<Tab>t`      | Normal  | Create a new tab |
| `<Tab>n`      | Normal  | Move to next tab |
| `<Tab>p`      | Normal  | Move to previous tab|
| `<Tab>c`      | Normal  | Close current tab |
| `<Tab><1-9>`  | Normal  | Switch to buffer 1-9 |

</details>

<details><summary>Quick Fix Mappings</summary>

### Quick Fix Mappings
```lua
-- Can be found in lua/core/mappings.lua
```

| Shortcut | Mode(s) | Description |
| -------- | ----    | -----  |
| `[l`     | Normal  | Previous location item |
| `]l`     | Normal  | Next location item |
| `[L`     | Normal  | First location item |
| `]L`     | Normal  | Last location item |
| `[g`     | Normal  | Previous qf item |
| `]g`     | Normal  | Next qf item |
| `[Q`     | Normal  | First qf item |
| `]Q`     | Normal  | Last qf item |
| `\x`     | Normal  | Close qf and location list |

</details>

<details><summary>Vista Mappings</summary>

### Vista Mappings 
```lua
-- Can be found in lua/core/mappings.lua
```
| Shortcut    | Mode(s) | Description |
| --------    | ----    | -----  |
| '<leader>t' | Normal  | Opens vista |

</details>

<details><summary>Git Signs Mappings</summary>

### Git Signs Mappings
```lua
-- Can be found in lua/config/gitsigns.lua
```

| Shortcut | Mode(s) | Description |
| -------- | ----    | -----  |
| `]c`     | Normal  | Go to next hunk | 
| `[c`     | Normal  | Go to previous hunk | 
| `<leader>hp` | Normal Previus hunk | 
| `<leader>hb` | Normal Previus hunk | 

</details>

<details><summary>Fugitive Mappings</summary>

### Fugitive Mappings 
```lua
-- Can be found in lua/config/fugitive.lua
```

| Shortcut | Mode(s) | Description |
| -------- | ----    | -----  |
| `<leader>gs`   | Normal  | Displays `git status`  |
| `<leader>gw`   | Normal  | `git add` current buffer | 
| `<leader>gc`   | Normal  | Run `git commit`   |
| `<leader>gd`   | Normal  | Run `git diff`     | 
| `<leader>gpl`  | Normal  | Run `git pull`     |
| `<leader>gpu`  | Normal  | Run `git push`     |

</details>

<details><summary>LeaderF Mappings</summary>

 ### LeaderF Mappings 
```lua
-- Can be found in core/plugins.vim
```
| Shortcut     | Mode(s) | Description |
| --------     | ----    | -----  |
| `<leader>ff` | Normal  | Search files | 
| `<leader>ff` | Normal  | Grep project files | 
| `<leader>fh` | Normal  | Search vim help files | 
| `<leader>ft` | Normal  | Search tags in current buffers| 
| `<leader>fb` | Normal  | Switch buffer | 
| `<leader>fr` | Normal  | Search recent files | 
| `<leader>fr` | Normal  | Search current buffer line | 
| `<C-N>`      | LeaderF | Move the cursor downward in the result window| 
| `<C-P>`      | LeaderF | Move the cursor upward in the result window|

</details>

<details><summary>Open-Browser Mappings</summary>

 ### Open-Browser Mappings 
```lua
-- Can be found in core/plugins.vim
```
| Shortcut     | Mode(s) | Description |
| --------     | ----    | -----  |
| `<leader>ob` | Normal  | Open URL in browser |

</details>

<details><summary>Markdown-preview Mappings</summary>

 ### Markdown-preview Mappings 
```lua
-- Can be found in core/plugins.vim
```
| Shortcut   | Mode(s) | Description |
| --------   | ----    | -----  |
| `<M-m>`    | Normal  | Markdown-preview |
| `<M-S-m>`  | Normal  | Stop markdown-preview|

</details>

<details><summary>LSP Mappings</summary>

### LSP Mappings 
```lua
-- Can be found in lua/config/lsp.lua
```
| Shortcut       | Mode(s) | Description |
| --------       | ----    | -----  |
| `gd`           | Noraml  | Go to definition (LSP) |
| `<C-]`         | Normal  | Signature help | 
| `<space>rn`    | Normal  | Variable rename | 
| `gr`           | Normal  | Show references | 
| `[d`           | Normal  | Previous diagnositc | 
| `]d`           | Normal  | Next diagnostic | 
| `<space>q`     | Normal  | Puts diagnostic to qf  |
| `<space>ca`    | Normal  | LSP code action | 
| `<space>wa`    | Normal  | Add workspace folder |
| `<space>wr`    | Normal  | Remove workspace folder |
| `<space>wl`    | Normal  | List workspace folder |
| `<space>f`     | Normal  | Fromat code | 

</details>


# Screenshots

# Contributing 
Create a PR. 

Feel free to email me at <mlkopitz@umich.edu>

# Inspirations 
