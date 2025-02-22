return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qS", function() require("persistence").select() end, desc = "Restore Session" },
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
