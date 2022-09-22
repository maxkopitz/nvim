scriptencoding utf-8
" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile

" Minimum lines to keep above and below cursor when scrolling 
set scrolloff=3

" 
" General tab settings
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=0    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Show line number and relative line number
set number relativenumber  " Show line number and relative line number

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

" Persistent undo even after you close a file and re-open it
set undofile

" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
set diffopt+=closeoff  " turn off diff when one file window is closed
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" Break line at predefined characters
set linebreak

" Use mouse to select and resize windows, etc.
set mouse=nic  " Enable mouse in several mode
set mousemodel=popup  " Set the behaviour of mouse

" Auto-write the file based on some condition
set autowrite

set nowrap 
set noruler

" Show hostname, full path of file and last-mod time on the window title. The
" meaning of the format str for strftime can be found in
" http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
" lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
set title
set titlestring=
set titlestring=%{utils#Get_titlestr()}

" change fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Disable showing current mode on command line since statusline plugins can show it.
set noshowmode

" List all matches and complete till longest common string
set wildmode=list:longest

