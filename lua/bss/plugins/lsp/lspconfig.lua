return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				plugins = {
					"nvim-dap-ui",
					types = true,
				},
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.lsp.set_log_level("ERROR")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					-- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- map("<leader>gD", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					-- map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- map(
					-- 	"<leader>ws",
					-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols,
					-- 	"[W]orkspace [S]ymbols"
					-- )

					map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Configurer le type de fichier pour GenExpr
			-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			-- 	pattern = "*.genexpr",
			-- 	callback = function()
			-- 		vim.bo.filetype = "genexpr"
			-- 	end,
			-- })

			-- [GenExpr]
			--
			-- local configs = require("lspconfig.configs")
			-- if not configs.genexpr_ls then
			-- 	configs.genexpr_ls = {
			-- 		default_config = {
			-- 			cmd = {
			-- 				"node",
			-- 				os.getenv("HOME") .. "/Code/projects/genexpr_ls/out/server/server.js",
			-- 				"--stdio",
			-- 			},
			-- 			root_dir = function(fname)
			-- 				return vim.fn.getcwd()
			-- 			end,
			-- 			filetypes = { "genexpr" },
			-- 			settings = {},
			-- 		},
			-- 	}
			-- end
			--
			-- require("lspconfig").genexpr_ls.setup({
			-- 	capabilities = capabilities,
			-- })

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							format = {
								enable = false,
							},
						},
					},
				},
				hls = {},
				jdtls = {},
				-- clangd = {
				--   completion = {
				--     enable = true
				--   }
				-- }
			}

			require("java").setup()

			---@diagnostic disable-next-line: missing-fields
			require("mason").setup({
				ui = {
					border = "single",
				},
			})

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			-- 	border = "rounded",
			-- 	max_width = 80,
			-- })

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
