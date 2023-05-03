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
vim.keymap.set('n', [[\x]], '<cmd>windo lclose <bar> cclose <cr>', {
  silent = true,
  desc = 'close qf and location list',
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

---- BUFFERLINE
vim.keymap.set('n', '<Tab>bb', ':BufferLinePick <CR>', { desc = 'Pick a buffer to open' })
vim.keymap.set('n', '<Tab>bc', ':BufferLinePickClose <CR>', { desc = 'Pick a buffer to close' })
vim.keymap.set('n', '<Tab>bn', ':BufferLineMoveNext <CR>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<Tab>bp', ':BufferLineMovePrev <CR>', { desc = 'Move to previous buffer' })
vim.keymap.set('n', '<Tab>t', ':tabnew <CR>', { desc = 'Create a new tab' })
vim.keymap.set('n', '<Tab>n', ':tabnext <CR>', { desc = 'Move to next tab' })
vim.keymap.set('n', '<Tab>p', ':tabprevious <CR>', { desc = 'Move to previous tab' })
vim.keymap.set('n', '<Tab>c', ':tabclose <CR>', { desc = 'Closes current tab' })
vim.keymap.set('n', '<Tab>1', ':BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<Tab>2', ':BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<Tab>3', ':BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<Tab>4', ':BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<Tab>5', ':BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<Tab>6', ':BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<Tab>7', ':BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<Tab>8', ':BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<Tab>9', ':BufferLineGoToBuffer 9<CR>')

--- NVIM TREE
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc="Toggle nvim tree"})
-- GIT LINKER
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true, desc="Git browser"})

-- GIT FUGITIVE
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = 'Git add' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
vim.keymap.set('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })

-- toggle_term
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_set_keymap('n', '<leader>lt', "<cmd>lua require('utils.terminals').project_info_toggle()<CR>", {silent = true, desc="Open tokei stats"})
vim.api.nvim_set_keymap('n', '<leader>ld', "<cmd>lua require('utils.terminals').dockerinfo_lazy()<CR>", {silent = true, desc= "Lazy Docker"})
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
