-- return {
--     "folke/snacks.nvim",
--     opts = {
--         -- your scroll configuration comes here
--         -- or leave it empty to use the default settings
--         -- refer to the configuration section below
--         scroll = { enabled = false }, -- disable snacks scroll because is too slow
--     },
-- }

return {
    "folke/snacks.nvim",
    opts = {
        scroll = { enabled = false }, -- disable snacks scroll because is too slow
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
 ]],
              -- stylua: ignore
              ---@type snacks.dashboard.Item[]
              keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },

                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },

                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
            },
        },
        -- picker = {
        --     ---@class snacks.picker.matcher.Config
        --     matcher = {
        --         fuzzy = true, -- use fuzzy matching
        --         smartcase = false, -- use smartcase
        --         ignorecase = false, -- use ignorecase
        --         sort_empty = false, -- sort results when the search string is empty
        --         filename_bonus = true, -- give bonus for matching file names (last part of the path)
        --         file_pos = true, -- support patterns like `file:line:col` and `file:line`
        --         -- the bonusses below, possibly require string concatenation and path normalization,
        --         -- so this can have a performance impact for large lists and increase memory usage
        --         cwd_bonus = false, -- give bonus for matching files in the cwd
        --         frecency = false, -- frecency bonus
        --         history_bonus = false, -- give more weight to chronological order
        --     },
        -- },
    },
}
