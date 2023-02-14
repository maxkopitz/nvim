-->Save key strokes, no longer need shift to enter command mode <--
vim.keymap.set({ 'n', 'x' }, ';', ':')

--> Switch windows <--
vim.keymap.set('n', '<Left>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<Right>', '<C-W>l', { silent = true })
vim.keymap.set('n', '<Up>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<Down>', '<C-W>j', { silent = true })

--> Quit all opened buffers <--
vim.keymap.set('n', '<Leader>Q', '<cmd>qa!<cr>', { silent = true, desc = 'quit nvim' })

--> Shortcut for faster save and quit <--
vim.keymap.set('n', '<Leader>w', '<cmd>update<cr>', { silent = true, desc = 'save buffer' })

--> Saves the file if modified and quit <--
vim.keymap.set('n', '<Leader>q', '<cmd>x<cr>', { silent = true, desc = 'quit current window' })

--> Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933 <--
vim.keymap.set('n', [[\d]], '<cmd>bprevious <bar> bdelete #<cr>', {
  silent = true,
  desc = 'delete buffer',
})

-- Close location list or quickfix list if they are present, see https://superuser.com/q/355325/736190
vim.keymap.set("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", {
  silent = true,
  desc = "close qf and location list",
})
--> Split windows <--
vim.keymap.set('n', [[<leader>\]], '<cmd>vsplit <cr>', { silent = true, desc = 'Veritcal split' })
vim.keymap.set('n', [[<leader>|]], '<cmd>split <cr>', { silent = true, desc = 'Horizontal split' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)


--> Go to start and end of current line in insert mode <--

vim.keymap.set('i', '<C-A>', '<HOME>')
vim.keymap.set('i', '<C-E>', '<END>')

--> Navigation in the location and quickfix list
vim.keymap.set('n', '[l', '<cmd>lprevious<cr>zv', { silent = true, desc = 'previous location item' })
vim.keymap.set('n', ']l', '<cmd>lnext<cr>zv', { silent = true, desc = 'next location item' })

vim.keymap.set('n', '[L', '<cmd>lfirst<cr>zv', { silent = true, desc = 'first location item' })
vim.keymap.set('n', ']L', '<cmd>llast<cr>zv', { silent = true, desc = 'last location item' })

vim.keymap.set('n', '[q', '<cmd>cprevious<cr>zv', { silent = true, desc = 'previous qf item' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>zv', { silent = true, desc = 'next qf item' })

vim.keymap.set('n', '[Q', '<cmd>cfirst<cr>zv', { silent = true, desc = 'first qf item' })
vim.keymap.set('n', ']Q', '<cmd>clast<cr>zv', { silent = true, desc = 'last qf item' })
--  ╭──────────────────────────────────────────────────────────╮
--  │ Blink cursour                                            │
--  ╰──────────────────────────────────────────────────────────╯
--  https://www.reddit.com/r/neovim/comments/y5jqpz/i_made_a_snippet_to_blink_your_cursor_so_that_you/ <--
local timer = vim.loop.new_timer()
local blink = function()
  local cnt, blink_times = 0, 8
  timer:start(
    0,
    100,
    vim.schedule_wrap(function()
      vim.cmd 'set cursorcolumn! cursorline!'

      cnt = cnt + 1
      if cnt == blink_times then
        timer:stop()
      end
    end)
  )
end

vim.keymap.set('n', '<leader>cb', blink, { desc = '' })
