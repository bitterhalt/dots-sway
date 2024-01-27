-- Function to ensure that Packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end

    return false
end

-- Ensure Packer is installed
local packer_bootstrap = ensure_packer()

-- Load Packer if it's installed
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- Packer configuration
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]])

-- Packer plugins setup
return packer.startup(function(use)
    use('goolord/alpha-nvim')
    use {
        'NvChad/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }
    use('moll/vim-bbye')
    use('bitterhalt/nvim-base16')
    use('akinsho/bufferline.nvim')
    use('wbthomason/packer.nvim')
    use('nvim-lualine/lualine.nvim')
    use('nvim-tree/nvim-tree.lua')
    use('kyazdani42/nvim-web-devicons')
    use('nvim-treesitter/nvim-treesitter')
--    use('navarasu/onedark.nvim')
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- LSP-Zero setup
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'dev-v3',
        requires = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end
            },
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }

    -- Vimwiki setup
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/Documents/.vimwiki/',
                    syntax = 'markdown',
                    ext = '.md',
                }
            }
        end
    }

    -- Markdown preview setup
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    -- Sync Packer if it was bootstrapped
    if packer_bootstrap then
        require("packer").sync()
    end
end)

