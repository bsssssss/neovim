return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
        dir = "/Users/bss/dev/github.com/bsssssss/nvim-treesitter",
		-- "nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- enable = false,
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
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
				"javascript",
				"typescript",
                "json",
                "jsonc"
			},
			-- Autoinstall languages that are not installed
			auto_install = false,

			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
				disable = { "tex", "latex" },
			},

			indent = { enable = true, disable = { "ruby", "supercollider" } },

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = {
							query = "@class.inner",
							desc = "Select inner part of a class region",
						},
						-- You can also use captures from other query groups like `locals.scm`
						["as"] = {
							query = "@local.scope",
							query_group = "locals",
							desc = "Select language scope",
						},
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = true,
				},
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			-- autotag = {
			-- 	enable = true,
			-- },
		},

		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = false

			local parser_config =
				require("nvim-treesitter.parsers").get_parser_configs()

			-- parser_config.genexpr = {
			-- 	install_info = {
			-- 		url = "/Users/bss/Code/git/bsssssss/tree-sitter-genexpr",
			-- 		-- url = "https://github.com/bsssssss/tree-sitter-genexpr",
			-- 		-- branch = "dev",
			-- 		-- files = { "src/parser.c", "src/scanner.c" },
			-- 		files = { "src/parser.c" },
			-- 		maintainer = "@bsssssss",
			-- 	},
			-- 	filetype = "genexpr", -- specify the filetype if it does not match the parser name
			-- }

			--          vim.opt.runtimepath:prepend("/users/bss/dev/github.com/bsssssss/tree-sitter-supercollider")
			parser_config.supercollider = {
				install_info = {
					url = "/Users/bss/dev/github.com/bsssssss/tree-sitter-supercollider",
					-- url = "https://github.com/madskjeldgaard/tree-sitter-supercollider",
					files = { "src/parser.c", "src/scanner.c" },
					-- branch = "this-and-super",
					maintainer = "@bsssssss",
				},
				filetype = "supercollider", -- if filetype does not agrees with parser name
			}

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
