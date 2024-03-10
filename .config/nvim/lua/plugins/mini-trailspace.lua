return {
    "echasnovski/mini.trailspace",
    version = false,
    event = "VeryLazy",
    config = function()
        require("mini.trailspace").setup({})

        vim.api.nvim_create_autocmd("BufWrite", {
            callback = function()
                MiniTrailspace.trim()
                MiniTrailspace.trim_last_lines()
            end
        })

        -- Disable for Lazy Window
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "lazy",
            callback = function(data)
                vim.b[data.buf].minitrailspace_disable = true
                vim.api.nvim_buf_call(data.buf, MiniTrailspace.unhighlight)
            end,
        })
    end
}
