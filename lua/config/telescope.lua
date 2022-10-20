local telescope = require("telescope")

telescope.setup({
  telescope.load_extension("workspaces"),
  extensions = {
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = true,
    }
  }
})
