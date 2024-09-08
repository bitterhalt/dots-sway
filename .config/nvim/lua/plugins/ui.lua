return {

  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.5,
            },
            width = 0.7,
            height = 0.7,
          },
        },
      }
    end,
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files <CR>", desc = "Find Files" },
      { "<leader>fa", "<CMD>Telescope find_files hidden=true <CR>", desc = "Find Also Hidden Files" },
      { "<leader><tab>", "<CMD>Telescope buffers <CR>", desc = "List buffers" },
      { "<leader>fr", "<CMD>Telescope oldfiles <CR>", desc = "Find recent files" },
      { "<leader>fw", "<CMD>Telescope live_grep <CR>", desc = "Live Grep" },
      { "<leader>ht", "<CMD>Telescope colorscheme <CR>", desc = "Browse themes" },
    },
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "auto" } })
    end,
  },

  --Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim",
    },
    config = function()
      require("bufferline").setup({
        options = {
          close_command = "Bdelete",
          numbers = "none",
          middle_mouse_command = nil,
          indicator_icon = nil,
          indicator = { style = "none" },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          diagnostics = false, -- | "nvim_lsp" | "coc",
          diagnostics_update_in_insert = false,
          offsets = { { filetype = "NvimTree", text = "[ NvimTree ]", padding = 1 } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
        },
      })
    end,
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        diagnostics = {
          enable = false,
          show_on_dirs = false,
        },
        view = {
          width = 25,
          side = "left",
        },
      })
    end,
    keys = {
      { "<f8>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvim tree" },
    },
  },
}
