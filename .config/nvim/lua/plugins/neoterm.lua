return {
    "kassio/neoterm",
    keys = {
        {
            "<A-CR>",
            "<Cmd>Ttoggle<CR>",
            mode = { "", "t" },
            desc = "Toggle the last active terminal buffer"
        }
    },
    config = function()
        vim.g.neoterm_autoinsert = true
        vim.g.neoterm_default_mod = "botright"
    end
}
