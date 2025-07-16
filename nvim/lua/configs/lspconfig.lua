require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",   -- lua
  "html",     -- html
  "ts_ls",    -- typescript, javascript
  "clangd",   -- c, cpp
  "jdtls",    -- java
  "pylsp",    -- python
  "bashls",   -- bash
  "marksman", -- markdown
  "texlab"    -- latex
}

vim.lsp.enable(servers)
