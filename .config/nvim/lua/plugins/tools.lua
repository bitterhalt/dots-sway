return {
  {
    -- ZenMode
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 140,
        height = 1,
        options = {},
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  --Which-key
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      icons = {
        breadcrumb = ">",
        separator = ">",
        group = "+",
      },
    },
    event = "VeryLazy",
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      config = function()
        require("noice").setup({
          -- add any options here
          routes = {
            {
              filter = {
                event = { "" },
                kind = "",
                find = "written",
              },
              opts = { skip = true },
            },
          },
        })
      end,
    },
  },
}
