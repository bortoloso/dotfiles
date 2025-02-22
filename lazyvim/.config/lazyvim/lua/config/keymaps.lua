-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>qS", function()
--   require("persistence").select()
-- end)

-- Use which-key to add keymaps with descriptions.
-- This is the preferred way to add keymaps.
-- Sessions are saved with the plugin persistence.nvim and stored in .local/state/nvim/ses
-- local wk = require("which-key")
-- wk.add({
--     {
--         "<leader>qS",
--         function()
--             require("persistence").select()
--         end,
--         desc = "Load Session",
--         mode = "n",
--     },
-- })
--
--
-- %s/\s\+$//e
--
--
vim.keymap.set("n", "<leader>cx", ":%s/\\s\\+$//e<CR>", { noremap = true, desc = "Remove trailing whitespace" })
vim.keymap.set("n", "<leader>y", "ggVGy<C-O>", { noremap = true, desc = "Select and copy all" })
