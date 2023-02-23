return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build',
    }

    -- TOC settings
    vim.g.vimtex_toc_config = {
      name = 'TOC',
      layers = { 'content', 'todo', 'include' },
      resize = 1,
      split_width = 30,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
      mode = 2,
    }
    vim.g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    vim.g.vimtex_view_general_options = '-r @line @pdf @tex'
  end
}
