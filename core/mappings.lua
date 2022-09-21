local keymap = vim.keymap
local api = vim.api


--> nvim tree keymap.setpings <--
keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>f', ':NvimTreeFocus<CR>')

--> BufferLine keymap.setpings <--
keymap.set("n", "<Tab>1", ":BufferLineGoToBuffer 1<CR>")
keymap.set("n", "<Tab>2", ":BufferLineGoToBuffer 2<CR>")
keymap.set("n", "<Tab>3", ":BufferLineGoToBuffer 3<CR>")
keymap.set("n", "<Tab>4", ":BufferLineGoToBuffer 4<CR>")
keymap.set("n", "<Tab>5", ":BufferLineGoToBuffer 5<CR>")
keymap.set("n", "<Tab>6", ":BufferLineGoToBuffer 6<CR>")
keymap.set("n", "<Tab>7", ":BufferLineGoToBufer 7<CR>")
keymap.set("n", "<Tab>8", ":BufferLineGoToBuffer 8<CR>")
keymap.set("n", "<Tab>9", ":BufferLineGoToBuffer 9<CR>")

--> Vista keymap.setpings <--
keymap.set("n", "<leader>v", ":Vista coc<CR>")

--> Git fugitive <--
keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git add" })
keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
keymap.set("n", "<leader>gpl", "<cmd>Git pull<cr>", { desc = "Git pull" })
keymap.set("n", "<leader>gpu", "<cmd>15 split|term git push<cr>", { desc = "Git push" })

--> Edit and reload nvim config file quickly
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})

keymap.set("n", "<leader>sv", "", {
  silent = true,
  desc = "reload init.lua",
  callback = function()
    vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
    vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
  end,
})

--> Quit all opened buffers <-- 
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

--> Shortcut for faster save and quit <--
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

--> Saves the file if modified and quit <--
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

--> Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933 <--
keymap.set("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", {
  silent = true,
  desc = "delete buffer",
})

--> Switch windows <--
keymap.set("n", "<left>", "<c-w>h")
keymap.set("n", "<Right>", "<C-W>l")
keymap.set("n", "<Up>", "<C-W>k")
keymap.set("n", "<Down>", "<C-W>j")

