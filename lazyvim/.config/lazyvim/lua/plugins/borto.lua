if true then
    return {
        -- Lua
        {
            "ludovicchabant/vim-gutentags",
            opts = function()
                vim.g.gutentags_cache_dir = "/home/bortoloso/.tags"
            end,
            config = function()
                -- vim.g.gutentags_cache_dir = expand("~/.tags/")
            end,
            -- opts = function()
            --     vim.g.gutentags_cache_dir = "~/.tags/"
            -- end,
            -- opts = {
            --     -- g:gutentags_cache_dir
            --     gutentags_cache_dir = { "~/.tags/" },
            -- },
        },
        {
            "folke/zen-mode.nvim",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
        -- add gruvbox
        { "ellisonleao/gruvbox.nvim" },

        -- Configure LazyVim to load gruvbox
        -- {
        --     "lazyvim/lazyvim",
        --     opts = {
        --         colorscheme = "gruvbox",
        --     },
        -- },
        {
            "garymjr/nvim-snippets",
            opts = {
                search_paths = { "/home/bortoloso/snippets" },
                friendly_snippets = true,
            },
        },
        { "mg979/vim-visual-multi" },
        { "sudormrfbin/cheatsheet.nvim" },
        {
            "karb94/neoscroll.nvim",
            opts = {
                mappings = { -- Keys to be mapped to their corresponding default scrolling animation
                    "<C-u>",
                    "<C-d>",
                    "<C-b>",
                    "<C-f>",
                    "<C-y>",
                    "<C-e>",
                    "zt",
                    "zz",
                    "zb",
                },
                -- hide_cursor = true, -- Hide cursor while scrolling
                --     stop_eof = true, -- Stop at <EOF> when scrolling downwards
                --     respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                --     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                duration_multiplier = 0.50, -- Global duration multiplier
                --     easing = "linear", -- Default easing function
                --     pre_hook = nil, -- Function to run before the scrolling animation starts
                --     post_hook = nil, -- Function to run after the scrolling animation ends
                --
                --     performance_mode = false, -- Disable "Performance Mode" on all buffers.
                --     ignored_events = { -- Events ignored while scrolling
                --         "WinScrolled",
                --         "CursorMoved",
                --     },
            },
            -- require("neoscroll").setup({
            --     mappings = { -- Keys to be mapped to their corresponding default scrolling animation
            --         "<C-u>",
            --         "<C-d>",
            --         "<C-b>",
            --         "<C-f>",
            --         "<C-y>",
            --         "<C-e>",
            --         "zt",
            --         "zz",
            --         "zb",
            --     },
            --     hide_cursor = true, -- Hide cursor while scrolling
            --     stop_eof = true, -- Stop at <EOF> when scrolling downwards
            --     respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            --     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            --     duration_multiplier = 1.0, -- Global duration multiplier
            --     easing = "linear", -- Default easing function
            --     pre_hook = nil, -- Function to run before the scrolling animation starts
            --     post_hook = nil, -- Function to run after the scrolling animation ends
            --
            --     performance_mode = false, -- Disable "Performance Mode" on all buffers.
            --     ignored_events = { -- Events ignored while scrolling
            --         "WinScrolled",
            --         "CursorMoved",
            --     },
            -- }),
        },
        require("luasnip.loaders.from_snipmate").lazy_load(),
    }
end

-- :%s/\s\+$//e
-- fun! TrimWhitespace()
--     let l:save = winsaveview()
--     keeppatterns %s/\s\+$//e
--     call winrestview(l:save)
-- endfun

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },

    -- Configure LazyVim to load gruvbox
    {
        "lazyvim/lazyvim",
        opts = {
            colorscheme = "gruvbox",
        },
    },

    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    -- disable trouble
    { "folke/trouble.nvim", enabled = false },

    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },

    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},
            },
        },
    },

    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
                "elixir",
                "heex",
                "eex",
            })
            vim.treesitter.language.register("markdown", "livebook")
        end,
    },

    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },
}
