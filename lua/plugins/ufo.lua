return {
    "kevinhwang91/nvim-ufo",
    enabled = true,
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function ()
        require("ufo").setup({})
    end
}
