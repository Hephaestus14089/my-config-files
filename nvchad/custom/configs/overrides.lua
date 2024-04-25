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
    "java",
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
    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- markdown
    "marksman",
    "markdownlint",

    -- python
    "python-lsp-server",
    "black",

    -- java
    "jdtls",

    -- c/cpp
    "clangd",
    "clang-format",

    -- shell
    "bash-language-server",
    "shellcheck",

    -- latex
    "texlab",
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
