-- My personal Nvim configuration
-- Email: mlkopitz@umich.edu

-- Packer config
require("packer-config") 

-- Configurations for plugins
require("settings") -- Vim config
require("mappings") -- Key mappings
require("colors-config.nightfox") 
require("nvim-tree-config") -- NVIM-Tree config
require("lualine-config") -- Lualine -- config
require("tssitter-config") -- TreeSitter config
require("barbar") -- Barbar config
require("dashboard-config")

