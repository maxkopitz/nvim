local sessions = require 'sessions'
local workspaces = require 'workspaces'

sessions.setup {
  events = { 'BufEnter' },
  session_filepath = '.nvim/session',
}

workspaces.setup {
  hooks = {
    -- hooks run before change directory
    open_pre = {
      -- If recording, save current session state and stop recording
      'SessionsStop',

      -- delete all buffers (does not save changes)
      'silent %bdelete!',
    },

    -- hooks run after change directory
    open = {
      -- load any saved session from current directory
      function()
        sessions.load(nil, { silent = true })
        print 'Opened workspace'
      end,
    },
  },
}
