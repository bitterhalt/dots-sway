return {

    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        keys = {
            {'<C-p>', "<CMD>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview"},
        },
    },
}
