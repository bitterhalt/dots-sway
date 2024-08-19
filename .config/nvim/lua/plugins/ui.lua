return {
    -- Base-16-nvim
    {
        "RRethy/base16-nvim",
        init = function()
            require('base16-colorscheme').setup({
                base00 = '#161616',
                base01 = '#262626',
                base02 = '#393939',
                base03 = '#525252',
                base04 = '#b4b7b4',
                base05 = '#c5c8c6',
                base06 = '#e0e0e0',
                base07 = '#ffffff',
                base08 = '#AC4242',
                base09 = '#F4BF75',
                base0A = '#FECA88',
                base0B = '#90A959',
                base0C = '#75B5AA',
                base0D = '#6A9FB5',
                base0E = '#AA759F',
                base0F = '#C28CB8'
            })
        end,
    },

    -- Mini.indentscope
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "│"
            })
        end,
        event = "VeryLazy",
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end,
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files <CR>",             desc = "Find Files" },
            { "<leader>fa", "<CMD>Telescope find_files hidden=true <CR>", desc = "Find Also Hidden Files" },
            { "<leader>fb", "<CMD>Telescope buffers <CR>",                desc = "List buffers" },
            { "<leader>fr", "<CMD>Telescope oldfiles <CR>",               desc = "Find recent files" },
            { "<leader>fw", "<CMD>Telescope live_grep <CR>",              desc = "Live Grep" },
            { "<leader>ht", "<CMD>Telescope colorscheme <CR>",            desc = "Browse themes" },
        },
    },

    -- Vim-bbye
    {
        "moll/vim-bbye",
        keys = {
            { "<S-q>", "<CMD>Bdelete!<CR>", desc = "Close buffer" },
        },
    },

    -- Mini notify
    {
        "echasnovski/mini.notify",
        version = false,
        init = function()
            vim.notify = require("mini.notify").make_notify()
        end,
        opts = {
            content = {
                format = function(notif) return notif.msg end,
            },
            window = {
                winblend = 0,
            },
            lsp_progress = {
                enable = true,
            },
        },
        event = "VeryLazy",
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

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({ options = { theme = "auto" } })
        end
    },

    --Bufferline

    {
        'akinsho/bufferline.nvim',
        version = "*",
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("bufferline").setup({
                options = {
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
                }
            })
        end,
    },

    --NvimTree
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
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
                }
            })
        end,
        keys = {
            { "<f8>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvim tree" },
        },
    },
}
