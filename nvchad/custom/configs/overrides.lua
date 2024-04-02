local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "python",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
    "fish",
    "bash",
    "yaml",
    "toml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  }
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- markdown stuff
    "marksman",
    "markdownlint",

    -- python stuff
    "python-lsp-server",
    "black",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- shell stuff
    "bash-language-server",
    "shellcheck",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
