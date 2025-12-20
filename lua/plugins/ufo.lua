return {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function ()
        require("ufo").setup({})
    end
}
