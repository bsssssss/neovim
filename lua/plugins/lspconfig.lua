return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			{ "mason-org/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

			-- Useful status updates for LSP.
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},

			-- Allows extra capabilities provided by nvim-cmp
			-- "hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
					backdrop = 100,
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSPs
					"lua-language-server",
					"basedpyright",
					"bash-language-server",
					"clangd",
					"cmake-language-server",
					"css-lsp",
					"emmet-language-server",
					"haskell-language-server",
					"texlab",
					"typescript-language-server",
					"lemminx",
					"jdtls",

					-- DAPs
					"codelldb",
					"java-debug-adapter",
					"java-test",
					"js-debug-adapter",

					-- Linters
					"htmlhint",

					-- Formatters
					"stylua",
					"beautysh",
					"bibtex-tidy",
					"black",
					"clang-format",
					"htmlbeautifier",
					"prettier",
					"prettierd",
					"xmlformatter",
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
