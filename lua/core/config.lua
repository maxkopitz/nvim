Core = {
  colorscheme = 'onedark',
  lsp_servers = {
  clangd = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  },
  gopls = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true, executable = 'pylint' },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
        },
      },
    },
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    flags = {
      debounce_text_changes = 200,
    },
  },
  tsserver = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  },
  html = {
    filetypes = { 'html', 'htmldjango' },
  },
  cssls = {},
  eslint = {},
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  bashls = {},
  tailwindcss = {},
}
}
