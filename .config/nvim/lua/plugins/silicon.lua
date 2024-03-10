return {
    "michaelrommel/nvim-silicon",
    keys = {
        { "<leader>sc", "<Cmd>Silicon<CR>", mode = "v" }
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
