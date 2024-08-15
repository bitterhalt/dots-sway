-- Interface
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.syntax = 'on'
vim.opt.termguicolors = true

-- Behavior
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.scrolloff = 4
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true

-- Line wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Undo and backup options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    command = '%s/\\s\\+$//e',
})

-- Show diagnostics on dialog on cursor hover
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float({ focusable = false })
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank(
            { igroup = "IncSearch", timeout = 150, on_visual = true }
        )
    end,
})
