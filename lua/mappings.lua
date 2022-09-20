--> Key mappings <--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' ' -- leader key

--> nvim tree mappings <--
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFocus<CR>', opts)

--> BufferLine mappings <--
map("n", "<Tab>,", ":BufferLinePrevious<CR>", opts)
map("n", "<Tab>.", ":BufferLineNext<CR>", opts)
map("n", "<Tab><", ":BufferLineMovePrevious<CR>", opts)
map("n", "<Tab>>", ":BufferLineMoveNext<CR>", opts)
map("n", "<Tab>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<Tab>2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<Tab>3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<Tab>4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<Tab>5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<Tab>6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<Tab>7", ":BufferLineGoToBufer 7<CR>", opts)
map("n", "<Tab>8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<Tab>9", ":BufferLineGoToBuffer 9<CR>", opts)
map("n", "<Tab>0", ":BufferLineLast<CR>", opts)
map("n", "<Tab>c", ":BufferLineClose<CR>", opts)
map("n", "<C-p>", ":BufferLinePick<CR>", opts)
map("n", "<leader>bb", ":BufferLineOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferLineOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferLineOrderByLanguage<CR>", opts)
