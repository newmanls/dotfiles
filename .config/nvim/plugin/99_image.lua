vim.pack.add({ 'https://github.com/3rd/image.nvim' })

require("image").setup({
    backend = "sixel",
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = "popup",
            floating_windows = false,
            filetypes = { "markdown", "vimwiki" },
        },
        html = {
            enabled = true,
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = "popup",
        },
        css = {
            enabled = true,
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = "popup",
        },
    },
})
