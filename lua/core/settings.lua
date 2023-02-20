-- Inspect something
function _G.inspect(item)
  vim.pretty_print(item)
end

vim.scriptencoding = 'utf-8'

vim.g.loaded_tutor_mode_plugin = 1 -- Disables vim tutor

vim.g.did_install_default_menus = 1 -- do not load menu

-- [[ Setting options ]]
-- See `:help vim.o`
-- Set highlight on search
vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.softtabstop = 2 -- Insert 2 spaces for a tab
vim.o.shiftwidth = 2 -- Change a number of space characeters inseted for indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.scrolloff = 8 -- Always keep space when scrolling to bottom/top edge
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true
-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
require('onedark').load()
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.swapfile = false
vim.o.autowrite = true

vim.o.ignorecase = true
vim.o.confirm = true

vim.grepprg = 'rg\\ --vimgrep\\ --no-heading\\ --smart-case'
vim.grepformat = '%f:%l:%c:%m'
