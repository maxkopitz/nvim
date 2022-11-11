local fn = vim.fn
local api = vim.api
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
    -- Packer can mange itself
    use { 'wbthomason/packer.nvim', opt = true }

    -- Load first
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }


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


    if vim.g.is_mac then
      use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' }
    end

    use {
      'p00f/clangd_extensions.nvim',
      after = 'nvim-cmp',
      config = [[require('lsp')]],
    }

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use {
      'williamboman/mason.nvim',
      "williamboman/mason-lspconfig.nvim",
      'neovim/nvim-lspconfig',
      after = 'cmp-nvim-lsp',
      config = [[require('lsp')]],
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
    use {
      'sbdchd/neoformat',
      cmd = { 'Neoformat' },
    }

    --> The missing auto-completion for cmdline! <--
    use {
      'gelguy/wilder.nvim',
      config = [[require('config.wilder')]]
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

------------------------------ neoformat settings -----------------------
vim.g.neoformat_enabled_python = { 'black', 'yapf' }
vim.g.neoformat_cpp_clangformat = {
  exe = 'clang-format',
  args = { '--style="{IndentWidth: 4}"' }
}
vim.g.neoformat_c_clangformat = {
  exe = 'clang-format',
  args = { '--style="{IndentWidth: 4}"' }
}

vim.g.neoformat_enabled_cpp = { 'clangformat' }
vim.g.neoformat_enabled_c = { 'clangformat' }

vim.g.neoformat_enabled_css = { 'prettier' }
vim.g.neoformat_enabled_html = { 'prettier' }
vim.g.neoformat_enabled_javascript = { 'prettier' }
vim.g.neoformat_enabled_typescript = { 'prettier' }
vim.g.neoformat_enabled_json = { 'prettier' }


------------------------------vim-auto-save settings------------------------------
vim.g.auto_save = 1

vim.g.Lf_PopupColorscheme = 'gruvbox_material'

-------------------------plasticboy/vim-markdown settings-------------------
-- Disable header folding
vim.g.vim_markdown_folding_disabled = 1

-- Whether to use conceal feature in markdown
vim.g.vim_markdown_conceal = 1

-- Disable math tex conceal and syntax highlight
vim.g.tex_conceal = ''
vim.g.vim_markdown_math = 0

-- Support front matter of various format
vim.g.vim_markdown_frontmatter = 1 -- for YAML format
vim.g.vim_markdown_toml_frontmatter = 1 -- for TOML format
vim.g.vim_markdown_json_frontmatter = 1 -- for JSON format

-- Let the TOC window autofit so that it doesn't take too much space
vim.g.vim_markdown_toc_autofit = 1


-------------------------UltiSnips settings-------------------
-- Trigger configuration. Do not use <tab> if you use YouCompleteMe
-- vim.g.UltiSnipsExpandTrigger = '<c-j>'

-- Do not look for SnipMate snippets
-- vim.g.UltiSnipsEnableSnipMate = 0

-- Shortcut to jump forward and backward in tabstop positions
-- vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'

-- Configuration for custom snippets directory, see
-- https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
-- vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips', 'my_snippets' }


------------------------markdown-preview settings-------------------
-- Only setting this for suitable platforms
if vim.g.is_win or vim.g.is_mac then
  -- Do not close the preview tab when switching to other buffers
  vim.g.mkdp_auto_close = 0
end

-----------------------------LeaderF settings---------------------
-- Do not use cache file
vim.g.Lf_UseCache = 0
-- Refresh each time we call leaderf
vim.g.Lf_UseMemoryCache = 0

--Ignore certain files and directories when searching files
vim.g.Lf_WildIgnore = {
  dir = { '.git', '__pycache__', '.DS_Store' },
  file = { '*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
    '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
    '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
    '*.mp3', '*.aac' }
}

-- Do not show fancy icons for Linux server.
if vim.g.is_linux then
  vim.g.Lf_ShowDevIcons = 0
end

-- Only fuzzy-search files names
vim.g.Lf_DefaultMode = 'FullPath'

-- vim.g.Lf_WindowPosition = 'popup'

-- vim.g.Lf_PreviewInPopup = 1

-- Popup window settings
local w = fn.float2nr(vim.o.columns * 0.8)
if w > 140 then
  vim.g.Lf_PopupWidth = 140
else
  vim.g.Lf_PopupWidth = w
end

vim.g.Lf_PopupPosition = { 0, fn.float2nr((vim.o.columns - vim.g.Lf_PopupWidth) / 2) }

-- Do not use version control tool to list files under a directory since
-- submodules are not searched by default.
vim.g.Lf_UseVersionControlTool = 0

-- Use rg as the default search tool
vim.g.Lf_DefaultExternalTool = "rg"

-- show dot files
vim.g.Lf_ShowHidden = 1

-- Disable default mapping
vim.g.Lf_ShortcutF = ""
vim.g.Lf_ShortcutB = ""

-- set up working directory for git repository
vim.g.Lf_WorkingDirectoryMode = 'a'

vim.g.Lf_PopupColorscheme = 'gruvbox_material'

--Change keybinding in LeaderF prompt mode, use ctrl-n and ctrl-p to navigate
--items.
vim.g.Lf_CommandMap = { ['<C-J>'] = { '<C-N>' }, ['<C-K>'] = { '<C-P>' } }


----------------------------vimtex settings-----------------------------
if (vim.g.is_win or vim.g.is_mac) and utils.executable('latex') then
  --Hacks for inverse search to work semi-automatically,
  --see https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/.
  -- function! s:write_server_name() abort
  --   let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
  --   call writefile([v:servername], nvim_server_file)
  -- endfunction

  -- augroup vimtex_common
  --   autocmd!
  --   autocmd FileType tex call s:write_server_name()
  --   autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
  -- augroup END

  vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
  }

  -- TOC settings
  vim.g.vimtex_toc_config = {
    name = 'TOC',
    layers = { 'content', 'todo', 'include' },
    resize = 1,
    split_width = 30,
    todo_sorted = 0,
    show_help = 1,
    show_numbers = 1,
    mode = 2,
  }

  -- Viewer settings for different platforms
  if vim.g.is_win then
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
  end

  if vim.g.is_mac then
    --vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    vim.g.vimtex_view_general_options = '-r @line @pdf @tex'

    -- augroup vimtex_mac
    -- autocmd!
    -- autocmd User VimtexEventCompileSuccess call UpdateSkim()
    -- augroup END

    -- The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
    -- function! UpdateSkim() abort
    -- let l:out = b:vimtex.out()
    -- let l:src_file_path = expand('%:p')
    -- let l:cmd = [g:vimtex_view_general_viewer, '-r']

    -- if !empty(system('pgrep Skim'))
    -- call extend(l:cmd, ['-g'])
    -- endif

    -- call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
  end
end

------------------------vim-grammarous settings------------------------------
if vim.g.is_mac then
  vim.g['grammarous#languagetool_cmd'] = 'languagetool'
  vim.g['grammarous#disabled_rules'] = {
    ['*'] = { 'WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
      'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
      'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
      'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
      'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
      'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
      'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
      'NON_STANDARD_WORD', 'AU', 'DATE_NEW_YEAR' },
  }

  api.nvim_create_augroup('grammarous_map', { clear = true })
  api.nvim_create_autocmd('FileType', {
    group = 'grammarous_map',
    pattern = 'markdown',
    callback = function()
      vim.keymap.set('n', '<leader>x', '<Plug>(grammarous-close-info-window)', {})
      vim.keymap.set('n', '<C-n>', '<Plug>(grammarous-move-to-next-error)', {})
      vim.keymap.set('n', '<C-p>', '<Plug>(grammarous-move-to-previous-error)', {})
    end,
  })
end

--------------------------- vista settings ----------------------------------
vim.g['vista#renderer#icons'] = { member = '', }
vim.g.vista_default_executive = 'nvim_lsp'
-- Do not echo message on command line
vim.g.vista_echo_cursor = 0
-- Stay in current window when vista window is opened
vim.g.vista_stay_on_open = 0

----------------------------open-browser.vim settings-------------------
if vim.g.is_win or vim.g.is_mac then
  -- Disable netrw's gx mapping.
  vim.g.netrw_nogx = 1
end
