return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = { 
            "javascript",
            "typescript",
            "c", 
            "cpp",
            "lua", 
            "rust" 
          },
          auto_install = true,
          highlight = { 
            enable = true, 
            additional_vim_regex_highlighting = false, 
          }
        }
    end, 
  },  
  {
    "nvim-treesitter/playground"
  },
}
