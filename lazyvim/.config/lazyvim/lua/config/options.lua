-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.spell = false
vim.opt_local.spell = false
vim.o.tags = "/home/bortoloso/.tags/plsql.tags"
vim.opt.smartcase = false -- Don't ignore case with capitals

-- Set filetype for Oracle object scripts
vim.filetype.add({
    pattern = {
        [".*%.FNC"] = "plsql",
        [".*%.PRC"] = "plsql",
        [".*%.PCK"] = "plsql",
        [".*%.VW"] = "plsql",
        [".*%.SRC"] = "plsql",
        [".*%.BAC"] = "plsql",
        [".*%.BAS"] = "plsql",
        [".*%.ACT"] = "plsql",
        [".*%.SQL"] = "plsql",
        [".*%.SCR"] = "plsql",
        [".*%.TRG"] = "plsql",
        [".*%.PKG"] = "plsql",
        [".*%.SEQ"] = "plsql",
        [".*%.JOB"] = "plsql",
        [".*%.UT"] = "plsql",

        [".*%.fnc"] = "plsql",
        [".*%.prc"] = "plsql",
        [".*%.pck"] = "plsql",
        [".*%.vw"] = "plsql",
        [".*%.src"] = "plsql",
        [".*%.bac"] = "plsql",
        [".*%.bas"] = "plsql",
        [".*%.act"] = "plsql",
        [".*%.sql"] = "plsql",
        [".*%.scr"] = "plsql",
        [".*%.trg"] = "plsql",
        [".*%.pkg"] = "plsql",
        [".*%.seq"] = "plsql",
        [".*%.job"] = "plsql",
        [".*%.ut"] = "plsql",
    },
})
