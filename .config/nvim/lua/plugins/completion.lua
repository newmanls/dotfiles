return {
    {
        "mattn/emmet-vim",
        lazy = true,
        ft = { "html", "htmldjango", "svelte", "astro" }
    },
    {
        "echasnovski/mini.completion",
        version = false,
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = {}
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        event = "VeryLazy",
        opts = {}
    },
    {
        'echasnovski/mini.snippets',
        version = false,
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function()
            local snippets_gen_loader = require('mini.snippets').gen_loader

            require('mini.snippets').setup({
                snippets = {
                    snippets_gen_loader.from_file('~/.config/nvim/snippets/_.json'),
                    snippets_gen_loader.from_lang(),
                },
            })
        end
    }
}
