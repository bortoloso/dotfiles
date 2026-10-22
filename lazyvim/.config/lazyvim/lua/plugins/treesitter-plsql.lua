if true then
    return {}
end
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- Registra parser customizado (API usada pelo LazyVim)
            opts.parsers = opts.parsers or {}
            opts.parsers.plsql = {
                install_info = {
                    url = "https://github.com/andreasmaierde/tree-sitter-plsql",
                    files = { "src/parser.c" }, -- se existir src/scanner.c, adicione também
                },
            }

            -- IMPORTANTE:
            -- Não adicione "plsql" em ensure_installed, senão ele avisa "unsupported language: plsql"
            -- (ensure_installed é para parsers oficiais do nvim-treesitter)

            -- Faz ft=plsql usar esse parser
            vim.treesitter.language.register("plsql", "plsql")
        end,
    },
}
