return {
    -- Extracted from echasnovski neovim config:
    -- https://github.com/echasnovski/nvim/blob/b5de3476bc9f6cfb2d5eada959e8283fc40bc4ea/lsp/lua_ls.lua

    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = {
                -- Don't analyze whole workspace, as it consumes too much CPU and RAM
                workspaceDelay = -1,
            },
            workspace = {
                -- Don't analyze code from submodules
                ignoreSubmodules = true,
                -- Add Neovim's methods for easier code writing
                library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
        },
    },
}
