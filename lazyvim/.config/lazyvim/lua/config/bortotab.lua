--
--
if true then
    return {}
end
return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                layout_config = {
                    prompt_position = "top", -- Sets the prompt position to the top
                },
            },
        },
    },
}

-- require("telescope").setup({
--     pickers = {
--         find_files = {
--             layout_config = {
--
--                 prompt_position = "top", -- or 'bottom'
--             },
--         },
--     },
-- })
--
-- local M = {}
-- vim.g.snacks_animate = false
-- lazy.nvim

-- return {
--     "folke/snacks.nvim",
--
--     ---@type snacks.Config
--     opts = {
--         animate = {
--             ---@class snacks.animate.Config
--             ---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
--             {
--                 ---@type snacks.animate.Duration|number
--
--                 duration = 20, -- ms per step
--                 easing = "linear",
--                 fps = 60, -- frames per second. Global setting for all animations
--             },
--             -- your animate configuration comes here
--             -- or leave it empty to use the default settings
--
--             -- refer to the configuration section below
--         },
--     },
-- }
-- require("borto")
-- function Borto(value)
--     print("value", value)
--     vim.api.nvim_echo({
--         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--         -- { out, "WarningMsg" },
--         { "\nPress any key to exit..." },
--     }, true, {})
-- end

-- return M
-- return {
--     borto = function()
--         print("hello")
--     end,
-- }
--function Tab(value)
--    print("value", value)
--end
--teste
