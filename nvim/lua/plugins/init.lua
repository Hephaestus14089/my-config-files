return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "lua", "luadoc", "printf", "vim", "vimdoc",
        "html", "css",
        "javascript", "json", "typescript", "tsx",
        "python",
        "java",
        "c", "cpp",
        "markdown", "markdown_inline",
        "bash", "fish",
        "yaml","toml",
  		},
  	},
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
