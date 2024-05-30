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


