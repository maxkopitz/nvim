vim.g.mapleader = " "

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard amazin
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- This is too smart
vim.keymap.set("n", "<leader><shift>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<Leader>w', '<cmd>update<cr>', { silent = true, desc = 'save buffer' })

-->Save key strokes, no longer need shift to enter command mode <--
vim.keymap.set({ 'n', 'x' }, ';', ':')

--> Switch windows <--
vim.keymap.set('n', '<Left>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<Right>', '<C-W>l', { silent = true })
vim.keymap.set('n', '<Up>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<Down>', '<C-W>j', { silent = true })

--> Split windows <--
vim.keymap.set('n', [[<leader>\]], '<cmd>vsplit <cr>', { silent = true, desc = 'Veritcal split' })
vim.keymap.set('n', [[<leader>|]], '<cmd>split <cr>', { silent = true, desc = 'Horizontal split' })

vim.keymap.set("n", "<leader>mb", "<cmd>!make<CR>", { silent = true })
vim.keymap.set("n", "<leader>mc", "<cmd>!make clean<CR>", { silent = true })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

