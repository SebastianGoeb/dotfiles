local overrides = require "custom.plugins.overrides"

local plugins = {
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
}

return plugins

