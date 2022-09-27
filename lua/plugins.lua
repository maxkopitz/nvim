local fn = vim.fn
local utils = require('utils')

-- https://github.com/jdhao/nvim-config/blob/master/lua/plugins.lua
vim.g.plugin_home = fn.stdpath('data') .. '/site/pack/packer'

local packer_dir = vim.g.plugin_home .. '/opt/packer.nvim'

local first_install = false

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_dir) == '' then
  first_install = true

  -- Now we need to install packer.nvim first.
  local packer_repo = 'https://github.com/wbthomason/packer.nvim'
  local install_cmd = string.format('!git clone --depth=1 %s %s', packer_repo, packer_dir)

  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  vim.cmd(install_cmd)
end

vim.cmd('packadd packer.nvim')

local packer = require('packer');
local packer_util = require('packer.util')

packer.startup {
  function(use) 
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

    use { 'wbthomason/packer.nvim',  opt = true }

    --> Auto complete <--
    use { 
      'onsails/lspkind-nvim', 
      event = 'VimEnter' 
    }
    -- auto-completion engine
    use { 
      'hrsh7th/nvim-cmp', 
      after = 'lspkind-nvim', 
      config = [[require('config.nvim-cmp')]] 
    }

    -- nvim-cmp completion sources
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }
    use { 
      'quangnguyen30192/cmp-nvim-ultisnips', 
      after = { 'nvim-cmp', 'ultisnips' } 
    }
    
    if vim.g.is_mac then
      use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' }
    end

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { 
      'neovim/nvim-lspconfig', 
      after = 'cmp-nvim-lsp', 
      config = [[require('config.lsp')]] 
    }

    --> Themes <--
    use { 'EdenEast/nightfox.nvim'} 
    use { 'navarasu/onedark.nvim', opt = true }
    use { 'sainnhe/edge', opt = true }
    use { 'sainnhe/sonokai', opt = true }
    use { 'sainnhe/gruvbox-material', opt = true }
    use { 'shaunsingh/nord.nvim', opt = true }
    use { 'NTBBloodbath/doom-one.nvim', opt = true }
    use { 'sainnhe/everforest', opt = true }
    use { 'rebelot/kanagawa.nvim', opt = true }
    use { 'catppuccin/nvim', as = 'catppuccin', opt = true }
    use { 'tomasiser/vim-code-dark', opt = true}

    use { 'kyazdani42/nvim-web-devicons'} 

    --> nvim-tree : A file Explorer For Neovim <--
    use { 
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = [[require('config.nvim-tree')]],
    }

    --> nvim-treesitter : Interface for tree-sitter in nvim <--
     use {
      'nvim-treesitter/nvim-treesitter',
      config = [[require('config.treesitter')]],
      run = ':TSUpdate',
      requires = {
        'windwp/nvim-ts-autotag', -- Automatically end & rename tags
       --  Dynamically set commentstring based on cursor location in file
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/playground',
      },
    }

    -- Super fast buffer jump
    use {
      'phaazon/hop.nvim',
      event = 'VimEnter',
      config = function()
        vim.defer_fn(function()
          require('config.nvim_hop')
        end, 2000)
      end,
    }

    --> lualine : nvim statusline written in lua <--
    use { 
      'nvim-lualine/lualine.nvim', 
      config = [[require('config.lualine')]]
    }

    --> nvim-autoapirs : autopair plugin <--
    use {
	    'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} 
      end
    }  

    --> bufferline.nvim : bufferline for nvim <--
    use { 
      'akinsho/bufferline.nvim',
      event = 'VimEnter',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = [[require('config.bufferline')]]
    } 

    --> dashboard.nvim <--
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = [[require('config.dashboard')]]
    }

    

    --> notification plugin <--
    use {
      'rcarriga/nvim-notify',
      event = 'BufEnter',
      config = function()
        vim.defer_fn(function()
          require('config.nvim-notify')
        end, 2000)
      end,
    }

    --> vista.vim <--
    if utils.executable('ctags') then
      use {
        'liuchengxu/vista.vim', 
          cmd ='Vista'}
    end

    --> Better escaping <--
    use {
      'jdhao/better-escape.vim', 
      event = 'InsertEnter'
    }

    --> Which key, know your keymappings <--
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
        end
    }

    -- Snippet engine and snippet template
    use { 'SirVer/ultisnips', event = 'InsertEnter' }
    use { 'honza/vim-snippets', after = 'ultisnips' }

    --> neoscroll : betterscrolling <--
    use {
      'karb94/neoscroll.nvim',
      event = 'VimEnter',
      config = function()
        vim.defer_fn(function()
          require('config.neoscroll')
        end, 2000)
      end,
    }
    
    --> For only linux and MacOS <--
    if utils.executable('tmux') then
      -- .tmux.conf syntax highlighting and setting check
      use { 'tmux-plugins/vim-tmux', ft = { 'tmux' } }
    end

    --> Git commands <--
    use { 
      'tpope/vim-fugitive', 
      event = 'User InGitRepo', 
      config = [[require('config.fugitive')]] 
    }
  
    --> Git commands <--
    use { 
      'rbong/vim-flog', 
      requires = 'tpope/vim-fugitive', 
      cmd = { 'Flog' } 
    }

    --> Git commands <--
    use { 
     'christoomey/vim-conflicted', 
     requires = 'tpope/vim-fugitive', 
     cmd = { 'Conflicted' } }

    -- Show git change (change, delete, add) signs in vim sign column
    use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

    -- Better git commit experience
    use { 'rhysd/committia.vim', opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

    --> nvim in the browser <--
    if vim.g.is_win or vim.g.is_mac then
      use {
        'glacambre/firenvim',
        run = function()
          fn['firenvim#install'](0)
        end,
        opt = true,
        setup = [[vim.cmd('packadd firenvim')]],
      }
    end

   -- Another markdown plugin
    use { 'plasticboy/vim-markdown', ft = { 'markdown' } }

    -- Faster footnote generation
    use { 'vim-pandoc/vim-markdownfootnotes', ft = { 'markdown' } }

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use { 'godlygeek/tabular', cmd = { 'Tabularize' } }

    -- Markdown JSON header highlight plugin
    use { 'elzr/vim-json', ft = { 'json', 'markdown' } }

    -- Markdown previewing (only for Mac and Windows)
    if vim.g.is_win or vim.g.is_mac then
      use {
        'iamcco/markdown-preview.nvim',
        run = function()
          fn['mkdp#util#install']()
        end,
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
      setup = [[vim.cmd('packadd wilder.nvim')]] 
    }
    
    --> Standalone UI for nvim-lsp progress. Eye candy for the impatient. <--
    use { 
      'j-hui/fidget.nvim', 
      after = 'nvim-lspconfig', 
      config = [[require('config.fidget-nvim')]] 
    }

    --> Highlight URLs inside vim <--
    use { "itchyny/vim-highlighturl", event = "VimEnter" }

    use { "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('config.bqf')]] }

    -- File search, tag search and more
    if vim.g.is_win then
      use { "Yggdroot/LeaderF", cmd = "Leaderf" }
    else
      use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }
    end
    
    --> telescope.nvim <--
    use {
      'nvim-telescope/telescope.nvim', 
      cmd = 'Telescope',         
      requires = { {'nvim-lua/plenary.nvim'} }
    }
        -- search emoji and other symbols
    use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

    -- For Windows and Mac, we can open an URL in the browser. For Linux, it may
    -- not be possible since we maybe in a server which disables GUI.
    if vim.g.is_win or vim.g.is_mac then
      -- open URL in browser
      use { "tyru/open-browser.vim", event = "VimEnter" }
    end

    --> persistant terminals <--
    use {
      "akinsho/toggleterm.nvim", 
      tag = '*', 
      config = [[require('config.toggleterm')]]
    }

    -- Only use these plugin on Windows and Mac and when LaTeX is installed
    if vim.g.is_win or vim.g.is_mac and utils.executable("latex") then
      use { "lervag/vimtex", ft = { "tex" } }
    end
    
  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(
    fn.stdpath('data'), 
    'site', 'lua', 'packer_compiled.lua'),
  },
}

if first_install then
  packer.sync()
else
  local status, _ = pcall(require, 'packer_compiled')
  if not status then
    local msg = 'File packer_compiled.lua not found: run PackerSync to fix!'
    vim.notify(msg, vim.log.levels.ERROR, { title = 'nvim-config' })
  end
end

