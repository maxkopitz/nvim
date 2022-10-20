local options = vim.o
local utils = require("utils")

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
options.fileencoding="utf-8"
options.fileencodings="ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"

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
options.mouse = "nic"

-- Set the behaviour of mouse
options.mousemodel = "popup"

-- Character to show before the lines that have been soft-wrapped
options.showbreak = "↪"

-- Set matching pairs of characters and highlight matching brackets
-- TODO figure this out
-- options.matchpairs.append("<:>,「:」,『:』,【:】,“:”,‘:’,《:》")
vim.cmd("set mps+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》")

-- Auto-write the file based on some condition
options.autowrite = true
options.wrap = false
options.ruler = false

-- Disable showing current mode on command line since statusline plugins can show it.
options.noshowmode = true

-- List all matches and complete till longest common string
options.wildmode = "list:longest"

-- Text after this column number is not highlighted
options.synmaxcol = 200
options.nostartofline = true

-- Virtual edit is useful for visual block edit
options.virtualedit = "block"

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
options.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20"
options.signcolumn = "auto:2"

-- diff options
-- diffopt = "vertical," -- show diff in vertical position
-- diffopt = diffopt .. "filler,"  -- show filler for deleted lines
-- diffopt = diffopt .. "closeoff,"  -- turn off diff when one file window is closed
-- diffots = diffopt .. "context:3,"  -- context for diff

-- change fillchars for folding, vertical split, end of buffer, and message separator
options.fillchars = "fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾"

-- Executable program to use for grep command 
if utils.executable("rg") then
  options.grepprg = "rg --vimgrep --no-heading --smart-case"
  options.grepformat = "%f:%l:%c:%m"
end
