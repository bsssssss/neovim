return {
    "brenoprata10/nvim-highlight-colors",
    enabled = false,
    config = function()
        require("nvim-highlight-colors").setup({
            render = "virtual",
            virtual_symbol = "●",
            virtual_symbol_prefix = "",
            virtual_symbol_suffix = "",
            virtual_symbol_position = "eol",
        })
    end,
}
