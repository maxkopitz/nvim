local fn = vim.fn
local api = vim.api
local global = vim.g

local utils = require 'utils'

-- Inspect something
function _G.inspect(item)
  vim.pretty_print(item)
end

-- https://github.com/kyazdani42/nvim-tree.lua
global.loaded = 1
global.loaded_netrwPlugin = 1

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
global.is_win = (utils.has 'win32' or utils.has 'win64') and true or false
global.is_linux = (utils.has 'unix' and (not utils.has 'macunix')) and true or false
global.is_mac = utils.has 'macunix' and true or false
global.logging_level = 'info'

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
global.loaded_perl_provider = 0 -- Disable perl provider
global.loaded_ruby_provider = 0 -- Disable ruby provider
global.loaded_node_provider = 0 -- Disable node provider
global.did_install_default_menus = 1 -- do not load menu

if utils.executable 'python3' then
  if global.is_win then
    global.python3_host_prog = fn.substitute(fn.exepath 'python3', '.exe$', '', 'g')
  else
    global.python3_host_prog = fn.exepath 'python3'
  end
else
  api.nvim_err_writeln 'Python3 executable not found! You must install Python3 and set its PATH correctly!'
  return
end

-- Custom mapping <leader>
-- NOTE: Must happen before plugins are required
global.mapleader = ',' -- leader key
global.maplocalleader = ','

-- Disables vim tutor
global.loaded_tutor_mode_plugin = 1

-- Disable sql omni completion, it is broken.
global.loaded_sql_completion = 1

-- Do not load tohtml.vim
global.loaded_2html_plugin = 1

-- Enable highlighting for lua HERE doc inside vim script
global.vimsyn_embed = 'l'

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
global.loaded_zipPlugin = 1
global.loaded_gzip = 1
global.loaded_tarPlugin = 1

-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
global.netrw_liststyle = 3
if global.is_win then
  global.netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
end

------------------------------------------------------------------------
--                         Option Settings                            --
------------------------------------------------------------------------
vim.scriptencoding = 'utf-8'
local o = vim.o
local opt = vim.opt

o.tabstop = 2 -- Insert 2 spaces for a tab
o.softtabstop = 2 -- Insert 2 spaces for a tab
o.shiftwidth = 2 -- Change a number of space characeters inseted for indentation
o.expandtab = true -- Use spaces instead of tabs
o.scrolloff = 8 -- Always keep space when scrolling to bottom/top edge
o.swapfile = false -- Swap not needed
o.number = true -- Shows current line number
o.relativenumber = true -- Enables relative number
o.fileencoding = 'utf-8' -- The encoding written to file
o.fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1'
o.splitbelow = true -- Horizontal splits will automatically be to the bottom
o.splitright = true -- Vertical splits will automatically be to the right
o.confirm = true -- Ask for confirmation when handling unsaved or read-only files
o.visualbell = true -- Do not use visualbells
o.errorbells = true -- Do not use errorbells
o.history = 500 -- The number of command and search history to keep
o.undofile = true -- Persistent undo even after you close a file and re-open it
o.termguicolors = true -- Enable true color support.
o.ignorecase = true -- Needed for smartcase
o.smartcase = true -- Uses case in search
o.linebreak = true -- Break line at predefined characters
o.mouse = 'nic' --- Enable mouse
o.mousemodel = 'popup' -- Set the behaviour of mouse
o.showbreak = '↪' -- Character to show before the lines that have been soft-wrapped
-- TODO: figure this out
-- options.matchpairs.append("<:>,「:」,『:』,【:】,“:”,‘:’,《:》")
vim.cmd 'set mps+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》' -- Set matching pairs of characters and highlight matching brackets
o.autowrite = true -- Auto-write the file based on some condition
o.wrap = false -- Display long lines as just one line
o.ruler = false
o.noshowmode = true -- Disable showing current mode on command line since statusline plugins can show it.
o.wildmode = 'list:longest' -- List all matches and complete till longest common string
o.synmaxcol = 200 -- Text after this column number is not highlighted
o.nostartofline = true
o.virtualedit = 'block' -- Virtual edit is useful for visual block edit

o.foldcolumn     = "0"
o.foldnestmax    = 0
o.foldlevel      = 99 --- Using ufo provider need a large value
o.foldlevelstart = 99 --- Expand all folds by default
-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
o.guicursor      = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20'
o.signcolumn     = 'auto:2'

-- diff options
o.diffopt = 'vertical,' -- show diff in vertical position
o.diffopt = o.diffopt .. 'filler,' -- show filler for deleted lines
o.diffopt = o.diffopt .. 'closeoff,' -- turn off diff when one file window is closed
o.diffopt = o.diffopt .. 'context:3,' -- context for diff
o.diffopt = o.diffopt .. 'internal,indent-heuristic,algorithm:histogram'

-- change fillchars for folding, vertical split, end of buffer, and message separator
-- options.fillchars = "fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾"

-- Do not show search match count on bottom right (seriously, I would strain my
-- neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
-- choice, IMHO.
-- Disable showing intro message (:intro)

opt.shortmess:append { S = true, I = true }

-- Show hostname, full path of file and last-mod time on the window title. The
-- meaning of the format str for strftime can be found in
-- http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
-- lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
o.title = true
o.titlestring = '%{utils#Get_titlestr()}'

-- Executable program to use for grep command
if utils.executable 'rg' then
  o.grepprg = 'rg\\ --vimgrep\\ --no-heading\\ --smart-case'
  o.grepformat = '%f:%l:%c:%m'
end

opt.clipboard:append { 'unnamed', 'unnamedplus' }
