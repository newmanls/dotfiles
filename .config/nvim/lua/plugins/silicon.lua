return {
    "michaelrommel/nvim-silicon",
    keys = {
        {
            "<leader>sc",
            "<Cmd>Silicon<CR>",
            mode = "v",
            desc = "Create image out of the selected lines"
        }
    },
    opts = {
        font = "Iosevka Nerd Font=24",
        theme = "OneHalfDark",
        to_clipboard = true,
        output = function()
            return "~/Pictures/Screenshots/" .. os.date("!%Y%m%d_%H%M%S") .. "_code.png"
        end,
    }
}
