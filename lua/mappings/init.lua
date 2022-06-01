local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' ' -- leader key

--> nvim tree mappings <--
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFocus<CR>', opts)

--> barbar mappings <--
map("n", "<Tab>,", ":BufferPrevious<CR>", opts)
map("n", "<Tab>.", ":BufferNext<CR>", opts)
map("n", "<Tab><", ":BufferMovePrevious<CR>", opts)
map("n", "<Tab>>", ":BufferMoveNext<CR>", opts)
map("n", "<Tab>1", ":BufferGoto 1<CR>", opts)
map("n", "<Tab>2", ":BufferGoto 2<CR>", opts)
map("n", "<Tab>3", ":BufferGoto 3<CR>", opts)
map("n", "<Tab>4", ":BufferGoto 4<CR>", opts)
map("n", "<Tab>5", ":BufferGoto 5<CR>", opts)
map("n", "<Tab>6", ":BufferGoto 6<CR>", opts)
map("n", "<Tab>7", ":BufferGoto 7<CR>", opts)
map("n", "<Tab>8", ":BufferGoto 8<CR>", opts)
map("n", "<Tab>9", ":BufferGoto 9<CR>", opts)
map("n", "<Tab>0", ":BufferLast<CR>", opts)
map("n", "<Tab>c", ":BufferClose<CR>", opts)
map("n", "<C-p>", ":BufferPick<CR>", opts)
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)
