return {
    {
        'hedyhli/markdown-toc.nvim',
        ft = 'markdown',
        opts = {
            fences = {
                enabled = true,
                start_text = 'TOC',
                end_text = 'TOC'
            },
            toc_list = {
                markers = '-',
            }
        }
    },
    {
        'toppair/peek.nvim',
        ft = 'markdown',
        event = 'VeryLazy',
        build = 'deno task --quiet build:fast',
        keys = {
            { '<leader>mp', function() require('peek').open() end }
        },
        opts = {
            app = 'browser'
        }
    }
}
