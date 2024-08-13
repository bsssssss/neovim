return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = "nvim-treesitter/playground",
		build = ":TSUpdate",

		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"genexpr",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},

		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true

			-- [[genExpr]]
			--
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			---@diagnostic disable-next-line: inject-field
			parser_config.genexpr = {
				install_info = {
					-- url = "https://github.com/sadguitarius/tree-sitter-genexpr",
					-- branch = "main",
					url = "~/git/tree-sitter-genexpr",
					files = { "src/parser.c", "src/scanner.c" },
					maintainer = "@sadguitarius",
				},
				filetype = "genexpr", -- specify the filetype if it does not match the parser name
			}

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
