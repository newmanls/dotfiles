return {
    'toppair/peek.nvim',
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    keys = {
        { '<f5>', function() require('peek').open() end }
    },
    opts = {
        app = 'browser'
    }
}
