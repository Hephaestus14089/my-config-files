---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "one_light" },
}

M.nvdash = { load_on_startup = true }

M.ui = {
  tabufline = {
    lazyload = false
  }
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
