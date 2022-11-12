local icons = require('utils.icons')

Core = {
  colorscheme = '',
  icons = icons, 
  plugins = {
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
    },
  },
}
