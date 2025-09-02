return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
        -- stylua: ignore start
        formatters_by_ft = {
            lua        = { "stylua" },
            haskell    = { "stylish-haskell" },
            c          = { "clang-format" },
            python     = { "black" },
            javascript = { "clang-format" },
            typescript = { "clang-format" },
            html       = { "htmlbeautifier" },
            markdown   = { "mdformat" },
        },
        -- stylua: ignore end
	},
}
