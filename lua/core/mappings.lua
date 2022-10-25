local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

-->Save key strokes, no longer need shift to enter command mode <--
keymap.set({ 'n', 'x' }, ';', ':')
--> nvim tree keymap.setpings <--
keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

--> BufferLine keymap.setpings <--
keymap.set('n', '<Tab>1', ':BufferLineGoToBuffer 1<CR>')
keymap.set('n', '<Tab>2', ':BufferLineGoToBuffer 2<CR>')
keymap.set('n', '<Tab>3', ':BufferLineGoToBuffer 3<CR>')
keymap.set('n', '<Tab>4', ':BufferLineGoToBuffer 4<CR>')
keymap.set('n', '<Tab>5', ':BufferLineGoToBuffer 5<CR>')
keymap.set('n', '<Tab>6', ':BufferLineGoToBuffer 6<CR>')
keymap.set('n', '<Tab>7', ':BufferLineGoToBuffer 7<CR>')
keymap.set('n', '<Tab>8', ':BufferLineGoToBuffer 8<CR>')
keymap.set('n', '<Tab>9', ':BufferLineGoToBuffer 9<CR>')

--> Vista keymap.setpings <--
keymap.set('n', '<leader>v', ':Vista nvim_lsp<CR>')

--> Git fugitive <--
keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = 'Git add' })
keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
keymap.set('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
keymap.set('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })

--> Edit and reload nvim config file quickly
keymap.set('n', '<leader>ev', '<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>', {
  silent = true,
  desc = 'open init.lua',
})

keymap.set('n', '<leader>sv', function()
  vim.cmd [[
    update $MYVIMRC
    source $MYVIMRC
  ]]
  vim.notify('Nvim config successfully reloaded!', vim.log.levels.INFO, { title = 'nvim-config' })
end, {
  silent = true,
  desc = { 'reload init.lua' },
})

--> Quit all opened buffers <--
keymap.set('n', '<leader>Q', '<cmd>qa!<cr>', { silent = true, desc = 'quit nvim' })

--> Shortcut for faster save and quit <--
keymap.set('n', '<leader>w', '<cmd>update<cr>', { silent = true, desc = 'save buffer' })

--> Saves the file if modified and quit <--
keymap.set('n', '<leader>q', '<cmd>x<cr>', { silent = true, desc = 'quit current window' })

--> Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933 <--
keymap.set('n', [[\d]], '<cmd>bprevious <bar> bdelete #<cr>', {
  silent = true,
  desc = 'delete buffer',
})

--> Switch windows <--
keymap.set('n', '<Left>', '<c-w>h')
keymap.set('n', '<Right>', '<C-W>l')
keymap.set('n', '<Up>', '<C-W>k')
keymap.set('n', '<Down>', '<C-W>j')

--> Go to start and end of current line in insert mode <--

keymap.set('i', '<C-A>', '<HOME>')
keymap.set('i', '<C-E>', '<END>')

--> Navigation in the location and quickfix list
keymap.set('n', '[l', '<cmd>lprevious<cr>zv', { silent = true, desc = 'previous location item' })
keymap.set('n', ']l', '<cmd>lnext<cr>zv', { silent = true, desc = 'next location item' })

keymap.set('n', '[L', '<cmd>lfirst<cr>zv', { silent = true, desc = 'first location item' })
keymap.set('n', ']L', '<cmd>llast<cr>zv', { silent = true, desc = 'last location item' })

keymap.set('n', '[q', '<cmd>cprevious<cr>zv', { silent = true, desc = 'previous qf item' })
keymap.set('n', ']q', '<cmd>cnext<cr>zv', { silent = true, desc = 'next qf item' })

keymap.set('n', '[Q', '<cmd>cfirst<cr>zv', { silent = true, desc = 'first qf item' })
keymap.set('n', ']Q', '<cmd>clast<cr>zv', { silent = true, desc = 'last qf item' })

--> Close location list or quickfix list if they are present, see https://superuser.com/q/355325/736190 <--
keymap.set('n', [[\x]], '<cmd>windo lclose <bar> cclose <cr>', {
  silent = true,
  desc = 'close qf and location list',
})

--> Split window
keymap.set('n', [[<leader>\]], '<cmd>vsplit <cr>', { silent = true, desc = 'Split screen' })

--> Blink cursour <--
--> https://www.reddit.com/r/neovim/comments/y5jqpz/i_made_a_snippet_to_blink_your_cursor_so_that_you/ <--
local timer = uv.new_timer()
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

keymap.set('n', '<leader>cb', blink)

--> Sessions Key Binds <--
keymap.set('n', '<leader>ss', '<cmd>SessionsSave <cr>', { silent = true, desc = 'Session save' })
keymap.set('n', '<leader>sl', '<cmd>SessionsLoad <cr>', { silent = true, desc = 'Session load' })
