-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Set commentstring for plsql filetype, because for some reason this don't work only based on syntax file(I'll investigate this later)
vim.api.nvim_command("autocmd FileType plsql setlocal commentstring=--\\ %s")
vim.api.nvim_command("autocmd FileType plsql setlocal foldmethod=indent")
vim.api.nvim_command("autocmd FileType plsql setlocal tabstop=4")
vim.api.nvim_command("autocmd FileType plsql setlocal shiftwidth=4")
vim.api.nvim_command("autocmd FileType plsql setlocal softtabstop=4")
