return {
	{ -- Autoformat
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
			formatters_by_ft = {
				lua = { "stylua" },
				haskell = { "stylish-haskell" },
				c = { "clang-format" },
				python = { "black" },
        javascript = { "clang-format" },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
