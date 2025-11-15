return {
    "nvim-mini/mini.nvim",
    config = function()
        require("mini.ai").setup()
        require("mini.surround").setup()
        -- require("mini.pairs").setup()
        require("mini.align").setup()
        require("mini.extra").setup()
    end,
}
