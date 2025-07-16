require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Markdown
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "toggle MarkdownPreview" })

map("n", "<leader>rm", function()
  require('render-markdown').set()
end, { desc = "toggle RenderMarkdown" })

-- laTex
map("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "laTex compile" })
map("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "laTex view" })

-- Zen
map("n", "<leader>zn", "<cmd>ZenMode<CR>", { desc = "toggle ZenMode" })
map("n", "<leader>tt", "<cmd>Twilight<CR>", { desc = "toggle Twilight" })
