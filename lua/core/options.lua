local fn = vim.fn
local api = vim.api

local utils = require 'utils'

-- Inspect something
function _G.inspect(item)
  vim.pretty_print(item)
end

-- https://github.com/kyazdani42/nvim-tree.lua
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (utils.has 'win32' or utils.has 'win64') and true or false
vim.g.is_linux = (utils.has 'unix' and (not utils.has 'macunix')) and true or false
vim.g.is_mac = utils.has 'macunix' and true or false
vim.g.logging_level = 'info'

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

if utils.executable 'python3' then
  if vim.g.is_win then
    vim.g.python3_host_prog = fn.substitute(fn.exepath 'python3', '.exe$', '', 'g')
  else
    vim.g.python3_host_prog = fn.exepath 'python3'
  end
else
  api.nvim_err_writeln 'Python3 executable not found! You must install Python3 and set its PATH correctly!'
  return
end

-- Custom mapping <leader>
-- NOTE: Must happen before plugins are required
vim.g.mapleader = ',' -- leader key
vim.g.maplocalleader = ','

-- Disables vim tutor
vim.g.loaded_tutor_mode_plugin = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = 'l'

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3
if vim.g.is_win then
  vim.g.netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
end

------------------------------------------------------------------------
--                         Settings                                   --
------------------------------------------------------------------------
vim.scriptencoding = 'utf-8'

local options = vim.o
local utils = require 'utils'

-- General tab settings
options.tabstop = 2
options.softtabstop = 2
options.shiftwidth = 2
options.expandtab = true

-- Minimum lines to keep above and below cursor when scrolling
options.scrolloff = 3

-- Disable creating swapfiles,
-- see https://stackoverflow.com/q/821902/6064933
options.swapfile = false

-- Show line number and relative line number
options.number = true
options.relativenumber = true

-- File and script encoding settings for vim
options.fileencoding = 'utf-8'
options.fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1'

-- Split window below/right when creating horizontal/vertical windows
options.splitbelow = true
options.splitright = true

-- Ask for confirmation when handling unsaved or read-only files
options.confirm = true

-- Do not use visual and errorbells
options.visualbell = true
options.errorbells = true

-- The number of command and search history to keep
options.history = 500

-- Persistent undo even after you close a file and re-open it
options.undofile = true

-- Enable true color support. Do not set this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
options.termguicolors = true

-- Ignore case in general, but become case-sensitive when uppercase is present
options.ignorecase = true
options.smartcase = true

-- Break line at predefined characters
options.linebreak = true

-- Use mouse to select and resize windows, etc.
-- Enable mouse in several mode
options.mouse = 'nic'

-- Set the behaviour of mouse
options.mousemodel = 'popup'

-- Character to show before the lines that have been soft-wrapped
options.showbreak = '↪'

-- Set matching pairs of characters and highlight matching brackets
-- TODO figure this out
-- options.matchpairs.append("<:>,「:」,『:』,【:】,“:”,‘:’,《:》")
vim.cmd 'set mps+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》'

-- Auto-write the file based on some condition
options.autowrite = true
options.wrap = false
options.ruler = false

-- Disable showing current mode on command line since statusline plugins can show it.
options.noshowmode = true

-- List all matches and complete till longest common string
options.wildmode = 'list:longest'

-- Text after this column number is not highlighted
options.synmaxcol = 200
options.nostartofline = true

-- Virtual edit is useful for visual block edit
options.virtualedit = 'block'

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
options.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20'
options.signcolumn = 'auto:2'

-- diff options
vim.o.diffopt = ''
vim.o.diffopt = 'vertical,' -- show diff in vertical position
vim.o.diffopt = vim.o.diffopt .. 'filler,' -- show filler for deleted lines
vim.o.diffopt = vim.o.diffopt .. 'closeoff,' -- turn off diff when one file window is closed
vim.o.diffopt = vim.o.diffopt .. 'context:3,' -- context for diff
vim.o.diffopt = vim.o.diffopt .. 'internal,indent-heuristic,algorithm:histogram'

-- change fillchars for folding, vertical split, end of buffer, and message separator
-- options.fillchars = "fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾"

-- Do not show search match count on bottom right (seriously, I would strain my
-- neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
-- choice, IMHO.
options.shortmess = options.shortmess .. 'S'

-- Disable showing intro message (:intro)

options.shortmess = options.shortmess .. 'I'

-- Show hostname, full path of file and last-mod time on the window title. The
-- meaning of the format str for strftime can be found in
-- http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
-- lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
options.title = true
options.titlestring = '%{utils#Get_titlestr()}'

-- Executable program to use for grep command
if utils.executable 'rg' then
  options.grepprg = 'rg\\ --vimgrep\\ --no-heading\\ --smart-case'
  options.grepformat = '%f:%l:%c:%m'
end

options.clipboard = options.clipboard .. 'unnamedplus'
