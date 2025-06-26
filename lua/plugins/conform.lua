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
      -- stylua: ignore start
			formatters_by_ft = {
				lua        = { "stylua" },
				haskell    = { "stylish-haskell" },
				c          = { "clang-format" },
				python     = { "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        html       = { "htmlbeautifier" },
        markdown   = { "mdformat" },
			},
			-- stylua: ignore end
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
