return {
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

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end,
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files <CR>", desc = "Find Files" },
            { "<leader>fa", "<CMD>Telescope find_files hidden=true <CR>", desc = "Find Also Hidden Files" },
            { "<leader>fb", "<CMD>Telescope buffers <CR>", desc = "List buffers" },
            { "<leader>fr", "<CMD>Telescope oldfiles <CR>", desc = "Find recent files" },
            { "<leader>fw", "<CMD>Telescope live_grep <CR>", desc = "Live Grep" },
            { "<leader>ht", "<CMD>Telescope colorscheme <CR>", desc = "Browse themes" },
        },
    },

    {
        "moll/vim-bbye",
        keys = {
            { "<S-q>", "<CMD>Bdelete!<CR>", desc = "Close buffer" },
        },
    },

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

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({ options = { theme = "auto" } })
        end
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "none",
                    --close_command = "Bdelete! %d",
                    --right_mouse_command = "Bdelete! %d",
                    --left_mouse_command = "buffer %d",
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
                    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
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

    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/Documents/personal/notes/',
                    syntax = 'markdown',
                    ext = '.md',
                }
            }
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
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
            {  "<C-n>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvim tree" },
        },
    },
}

