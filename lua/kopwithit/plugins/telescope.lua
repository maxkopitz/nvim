return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extension = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')

        local mutli_ripgrep = require "kopwithit.telescope.multi-ripgrep"
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', mutli_ripgrep)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>en', function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
        vim.keymap.set('n', '<leader>ep', function()
            require('telescope.builtin').find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end)

    end
}
