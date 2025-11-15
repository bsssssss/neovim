return {
    "bsssssss/scheme2max.nvim",
    lazy = true,
    dependencies = "davidgranstrom/osc.nvim",
    config = function()
        require("scheme2max").setup()
    end,
}
