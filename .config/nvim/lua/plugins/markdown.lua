return {
    -- Markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        keys = {
            { '<C-p>', "<CMD>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
        },
    },
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<leader>mt", "<cmd>Markview<CR>", desc = "Toggle markview" },
        }
    },
    -- Obsidian-nvim
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            -- Default directory if no path is provided
            local default_dir = vim.fn.expand("$HOME/Documents/personal/notes")

            -- Check if the default directory exists, if not, create it
            if vim.fn.isdirectory(default_dir) == 0 then
                vim.fn.mkdir(default_dir, "p")
            end

            return {
                workspaces = {
                    {
                        -- Default to this directory if no path is provided by the user
                        name = "personal",
                        -- Replace the default_dir if you want to use different path
                        path = default_dir,
                    },
                },
            }
        end,
        keys = {
            { "<leader>os",  "<cmd>ObsidianSearch<CR>",      desc = "Open obsidian search menu" },
            { "<leader>os",  "<cmd>ObsidianSearch<CR>",      desc = "Open obsidian search menu" },
            { "<leader>of",  "<cmd>ObsidianLinks<CR>",       desc = "Open obsidian links menu" },
            { "<leader>oq",  "<cmd>ObsidianQuickSwitch<CR>", desc = "Open Obsidian Quick Switch menu" },
            { "<leader>ot",  "<cmd>ObsidianTags<CR>",        desc = "Open obsidian tag finder" },
            { "<leader>obl", "<Cmd>ObsidianBacklinks<CR>",   desc = "Open backlinks menu for current note" },
            { "<leader>obr", "<Cmd>ObsidianRename<CR>",      desc = "Rename Note" },
        },
    },
}
