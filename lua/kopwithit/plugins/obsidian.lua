return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/src/vaultM/**.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = "~/src/vaultM",
    notes = "notes",
    daily_notes = {
      folder = "notes/daily",
    },
    templates = {
      subdir = "templates",
      date_format = "%m-%d-%Y-%a",
      time_format = "%H:%M"
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({"open", url})  -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
  },
  config = function (_, opts)
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })

    require('obsidian').setup(opts)
  end,
}
