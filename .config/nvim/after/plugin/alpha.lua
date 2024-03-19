local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end


local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "",
    " Neovim ",
    "",
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  > Create", ":ene <BAR> startinsert<CR>"),
    dashboard.button("fr", "  > Recents", ":Telescope oldfiles<CR>"),
    dashboard.button("ff", "  > Search", ":Telescope find_files<CR>"),
    dashboard.button("ht", "  > Themes  ", ":Telescope colorscheme<CR>"),
    dashboard.button("u", "  > Update plugins", "<cmd>PackerSync<CR>"),
    dashboard.button("q", "  > Quit", ":qa!<CR>"),
}
dashboard.section.header.opts.hl = "Include"
dashboard.section.footer.opts.hl = "Include"
dashboard.opts.opts.noautocmd = false
--vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)

-- Disable statuslines in dashboard

vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    desc = "disable tabline for alpha",
    callback = function()
        vim.opt.showtabline = 0
    end,
})
vim.api.nvim_create_autocmd("BufUnload", {
    buffer = 0,
    desc = "enable tabline after alpha",
    callback = function()
        vim.opt.showtabline = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local old_laststatus = vim.opt.laststatus
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
            end,
        })
        vim.opt.laststatus = 0
    end,
})
