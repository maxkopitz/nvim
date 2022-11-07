local fn = vim.fn
local utils = require 'utils'

-- https://github.com/jdhao/nvim-config/blob/master/lua/plugins.lua
vim.g.plugin_home = fn.stdpath 'data' .. '/site/pack/packer'

--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer
--- false: if packer has been installed
local function packer_ensure_install()
  -- Where to install packer.nvim -- the package manager (we make it opt)
  local packer_dir = vim.g.plugin_home .. '/opt/packer.nvim'

  if fn.glob(packer_dir) ~= '' then
    return false
  end

  -- Auto-install packer in case it hasn't been installed.
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})

  local packer_repo = 'https://github.com/wbthomason/packer.nvim'
  local install_cmd = string.format('!git clone --depth=1 %s %s', packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

--> Load packer.nvim <--
vim.cmd 'packadd packer.nvim'

local packer = require 'packer'
local packer_util = require 'packer.util'


packer.startup {
  function(use)
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

    use { 'wbthomason/packer.nvim', opt = true }

    --> Auto complete <--
    use {
      'onsails/lspkind-nvim',
      event = 'VimEnter',
    }
    -- auto-completion engine
    use {
      'hrsh7th/nvim-cmp',
      after = 'lspkind-nvim',
      config = [[require('config.nvim-cmp')]],
    }

    -- nvim-cmp completion sources
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' }, }

    use {
      'williamboman/mason.nvim',
      config = [[require('config.mason')]],
    }

    if vim.g.is_mac then
      use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' }
    end

    use {
      'p00f/clangd_extensions.nvim',
      after = 'nvim-cmp',
      config = [[require('config.lsp')]],
    }

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use {
      'neovim/nvim-lspconfig',
      after = 'cmp-nvim-lsp',
      config = [[require('config.lsp')]],
    }

    --> Themes <--
    use { 'EdenEast/nightfox.nvim' }
    -- use { 'navarasu/onedark.nvim', opt = true }
    use { 'sainnhe/edge', opt = true }
    use { 'sainnhe/sonokai', opt = true }
    use { 'sainnhe/gruvbox-material', opt = true }
    use { 'shaunsingh/nord.nvim', opt = true }
    use { 'NTBBloodbath/doom-one.nvim', opt = true }
    use { 'sainnhe/everforest', opt = true }
    use { 'rebelot/kanagawa.nvim', opt = true }
    use { 'catppuccin/nvim', as = 'catppuccin', opt = true }
    use { 'tomasiser/vim-code-dark', opt = true }

    use { 'kyazdani42/nvim-web-devicons' }

    --> nvim-tree : A file Explorer For Neovim <--
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = [[require('config.nvim-tree')]],
    }

    --> nvim-treesitter : Interface for tree-sitter in nvim <--
    if vim.g.is_mac then
      use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        run = ':TSUpdate',
        config = [[require('config.treesitter')]],
      }
    end

    -- Super fast buffer jump
    use {
      'phaazon/hop.nvim',
      event = 'VimEnter',
      config = function()
        vim.defer_fn(function()
          require 'config.nvim_hop'
        end, 2000)
      end,
    }

    --> lualine : nvim statusline written in lua <--
    use {
      'nvim-lualine/lualine.nvim',
      config = [[require('config.lualine')]],
    }

    --> nvim-autoapirs : autopair plugin <--
    use { 'windwp/nvim-autopairs' }
    use { 'https://github.com/windwp/nvim-ts-autotag' }

    --> bufferline.nvim : bufferline for nvim <--
    use {
      'akinsho/bufferline.nvim',
      event = 'VimEnter',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = [[require('config.bufferline')]],
    }

    --> dashboard.nvim <--
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = [[require('config.dashboard')]],
    }

    --> notification plugin <--
    use {
      'rcarriga/nvim-notify',
      event = 'BufEnter',
      config = function()
        vim.defer_fn(function()
          require 'config.nvim-notify'
        end, 2000)
      end,
    }

    --> vista.vim <--
    if utils.executable 'ctags' then
      use {
        'liuchengxu/vista.vim',
        cmd = 'Vista',
      }
    end

    --> Better escaping <--
    use {
      'jdhao/better-escape.vim',
      event = 'InsertEnter',
    }

    --> Which key, know your keymappings <--
    use {
      'folke/which-key.nvim',
      config = function()
        vim.defer_fn(function()
          require 'config.which-key'
        end, 2000)
      end,
    }

    -- Snippet engine and snippet template
    use { 'SirVer/ultisnips', event = 'InsertEnter' }
    use { 'honza/vim-snippets', after = 'ultisnips' }

    --> For only linux and MacOS <--
    if utils.executable 'tmux' then
      -- .tmux.conf syntax highlighting and setting check
      use { 'tmux-plugins/vim-tmux', ft = { 'tmux' } }
    end

    use { 'ii14/emmylua-nvim', ft = 'lua' }

    --> Git commands <--
    use {
      'tpope/vim-fugitive',
      event = 'User InGitRepo',
      config = [[require('config.fugitive')]],
    }

    --> Git commands <--
    use {
      'rbong/vim-flog',
      requires = 'tpope/vim-fugitive',
      cmd = { 'Flog' },
    }

    --> Git commands <--
    use {
      'christoomey/vim-conflicted',
      requires = 'tpope/vim-fugitive',
      cmd = { 'Conflicted' },
    }

    -- Show git change (change, delete, add) signs in vim sign column
    use {
      'lewis6991/gitsigns.nvim',
      config = [[require('config.gitsigns')]],
    }

    -- Better git commit experience
    use {
      'rhysd/committia.vim',
      opt = true,
      setup = [[vim.cmd('packadd committia.vim')]],
    }

    use {
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
      event = 'User InGitRepo',
      config = [[require('config.git-linker')]],
    }

    -- Another markdown plugin
    use {
      'plasticboy/vim-markdown',
      ft = { 'markdown' },
    }

    -- Faster footnote generation
    use {
      'vim-pandoc/vim-markdownfootnotes',
      ft = { 'markdown' },
    }

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use {
      'godlygeek/tabular',
      cmd = { 'Tabularize' },
    }

    -- Markdown previewing (only for Mac and Windows)
    if vim.g.is_win or vim.g.is_mac then
      use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        ft = { 'markdown' },
      }
    end

    --> adds various text objects <--
    use { 'wellle/targets.vim', event = 'VimEnter' }

    if vim.g.is_mac then
      use { 'rhysd/vim-grammarous', ft = { 'markdown' } }
    end

    --> Auto format tools <--
    use { 'sbdchd/neoformat', cmd = { 'Neoformat' } }

    --> The missing auto-completion for cmdline! <--
    use {
      'gelguy/wilder.nvim',
      opt = true,
      setup = [[vim.cmd('packadd wilder.nvim')]],
    }

    --> Standalone UI for nvim-lsp progress. Eye candy for the impatient. <--
    use {
      'j-hui/fidget.nvim',
      after = 'nvim-lspconfig',
      config = [[require('config.fidget-nvim')]],
    }



    --> Highlight URLs inside vim <--
    use {
      'itchyny/vim-highlighturl',
      event = 'VimEnter',
    }

    use {
      'kevinhwang91/nvim-bqf',
      ft = 'qf',
      config = [[require('config.bqf')]],
    }

    -- File search, tag search and more
    if vim.g.is_win then
      use { 'Yggdroot/LeaderF', cmd = 'Leaderf' }
    else
      use {
        'Yggdroot/LeaderF',
        cmd = 'Leaderf',
        run = ':LeaderfInstallCExtension',
      }
    end

    --> telescope.nvim <--
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = [[require('config.telescope')]],
    }
    -- search emoji and other symbols
    use { 'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim' }

    -- For Windows and Mac, we can open an URL in the browser. For Linux, it may
    -- not be possible since we maybe in a server which disables GUI.
    if vim.g.is_win or vim.g.is_mac then
      -- open URL in browser
      use { 'tyru/open-browser.vim', event = 'VimEnter' }
    end

    --> persistant terminals <--
    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = [[require('config.toggleterm')]],
    }

    -- Only use these plugin on Windows and Mac and when LaTeX is installed
    if vim.g.is_win or vim.g.is_mac and utils.executable 'latex' then
      use { 'lervag/vimtex', ft = { 'tex' } }
    end
    -- Comment plugin
    use { 'tpope/vim-commentary', event = 'VimEnter' }

    -- Autosave files on certain events
    use { '907th/vim-auto-save', event = 'InsertEnter' }

    use { 'alvan/vim-closetag' }

    -- Show match number and index for searching
    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = { { 'n', '*' }, { 'n', '#' }, { 'n', 'n' }, { 'n', 'N' } },
      config = [[require('config.hlslens')]],
    }

    --> Show undo history visually <--
    use { 'simnalamburt/vim-mundo', cmd = { 'MundoToggle', 'MundoShow' } }

    --> A Vim text editor plugin to swap delimited items <--
    use { 'machakann/vim-swap', event = 'VimEnter' }

    --> Stylu
    use { 'ckipp01/stylua-nvim', run = 'cargo install stylua' }

    --> Session and workspace management
    use {
      'natecraddock/workspaces.nvim',
      config = [[require('config.workspaces')]],
    }

    use {
      'natecraddock/sessions.nvim',
      config = [[require('config.workspaces')]],
    }

    -- Used for after/ftplugin/json.lua
    use { 'https://github.com/phelipetls/jsonpath.nvim' }

    use {
      'https://github.com/norcalli/nvim-colorizer.lua',
      config = [[require('config.colorizer')]],
    }

  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(fn.stdpath 'data', 'site', 'lua', 'packer_compiled.lua'),
    display = {
      open_fn = function()
        return packer_util.float({ border = 'rounded' })
      end
    },
  },
}

-- For fresh install,
if fresh_install then
  packer.sync()
else
  local status, _ = pcall(require, 'packer_compiled')
  if not status then
    local msg = 'File packer_compiled.lua not found: run PackerSync to fix!'
    vim.notify(msg, vim.log.levels.ERROR, { title = 'nvim-config' })
  end
end
