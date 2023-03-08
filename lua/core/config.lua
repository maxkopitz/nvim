Core = {
  colorscheme = 'onedark',
  lsp_servers = {
    clangd = {
      cmd = { 'clangd' },
      filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    },
    gopls = {},
    pyright = {},
    tsserver = {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' },
    },
    html = {
      filetypes = { 'html', 'htmldjango' },
    },
    cssls = {},
    eslint = {},
    lua_ls = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
    bashls = {},
    tailwindcss = {},
    rust_analyzer = {}
  },
}
