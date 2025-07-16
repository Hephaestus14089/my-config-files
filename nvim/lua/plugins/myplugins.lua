local overrides = require("configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = ":call mkdp#util#install()",
    -- build = function()
    --   vim.cmd [[Lazy load markdown-preview.nvim]]
    --   vim.fn["mkdp#util#install"]()
    -- end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
  },

  {
    "lervag/vimtex",
    ft = { "markdown" },
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" }
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight" }
  },
}

return plugins
