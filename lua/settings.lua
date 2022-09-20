local set = vim.opt

set.fileencoding = "utf-8"
set.hidden = true
set.cmdheight=2
set.updatetime=300
set.filetype = on
--filetype plugin on
--filetype indent on
--syntax on
set.number = true
set.shiftwidth = 0
set.tabstop = 2
set.expandtab = true
set.scrolloff = 10
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.showcmd = true
set.showmode = true
set.showmatch = true
set.hlsearch = true
set.history = 1000
set.wildmenu = true
set.wildmode = "list:longest"
--set.wildignore = *.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set.mouse = "a"
set.splitright = true
set.splitbelow = true

vim.cmd("colorscheme nightfox")
