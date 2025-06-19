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
			vim.lsp.set_log_level("ERROR")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("K", function()
						vim.lsp.buf.hover({
							border = "single",
							max_height = 10,
						})
					end, "Hover")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
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
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
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

			-- [GenExpr language server]
			--
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "genexpr",
				callback = function()
					vim.defer_fn(function()
						vim.cmd(":InspectTree")
						local sendBottomKey = vim.api.nvim_replace_termcodes("<C-w>J", true, false, true)
						vim.api.nvim_feedkeys(sendBottomKey, "n", false)
					end, 100)
					vim.defer_fn(function()
						local goBack = vim.api.nvim_replace_termcodes("<C-w>k", true, false, true)
						vim.api.nvim_feedkeys(goBack, "n", false)
					end, 100)

					-- Start the language server
					vim.lsp.start({
						name = "genexpr-language-server",
						cmd = { "node", vim.fn.expand("~/dev/github.com/bsssssss/genexpr-language-server/out/server/server.js"), "--stdio" },
						handlers = {
							["window/showMessage"] = function(_, result, ctx)
								vim.notify(result.message, vim.log.levels.INFO, { title = "GenExpr LSP" })
							end,
							["window/logMessage"] = function(_, result, ctx)
								vim.notify("LSP log: " .. result.message, vim.log.levels.DEBUG, {})
							end,
						},
						root_dir = vim.fn.getcwd(),
					})
				end,
			})

			-- [Tidal language server]
			--
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tidal",
				callback = function()
					-- local logfile = "/tmp/tidal_ls.log"
					local client_id = vim.lsp.start({
						name = "tidal_ls",
						cmd = { vim.fn.expand("~/.local/bin/tidal-ls") },
						handlers = {
							["window/showMessage"] = function(_, result, ctx)
								vim.notify("LSP Message: " .. result.message, vim.log.levels.INFO, { title = "Tidal LSP" })
							end,
							["window/logMessage"] = function(_, result, ctx)
								vim.notify("LSP Log: " .. result.message, vim.log.levels.DEBUG, { title = "Tidal LSP Log" })
							end,
						},
					})
					if not client_id then
						vim.notify("Failed to start LSP client", vim.log.levels.ERROR)
					else
						vim.notify("LSP client started", vim.log.levels.INFO)
					end
				end,
			})

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
				pylsp = {},
				ts_ls = {},
				cssls = {},
				-- racket_langserver = {},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

			---@diagnostic disable-next-line: missing-fields
			require("mason").setup({
				ui = {
					border = "single",
					backdrop = 100,
				},
			})

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"java-debug-adapter",
					"java-test",
				},
			})

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						-- jdtls has it's own attach logic (in ftplugin/java.lua) so we avoid it here
						if server_name ~= "jdtls" then
							local server = servers[server_name] or {}
							server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
							require("lspconfig")[server_name].setup(server)
						end
					end,
				},
			})

			-- require("lspconfig").racket_langserver.setup({})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
