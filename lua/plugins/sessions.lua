return {
	{
		"Shatur/neovim-session-manager",
		config = function()
			local config = require("session_manager.config")
			local sm = require("session_manager")
			sm.setup({
				autosave_ignore_dirs = { "~/", "~/Code", "~/Downloads", "/" },
				autoload_mode = { config.AutoloadMode.Disabled },
			})
			-- Auto save session
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				callback = function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						-- Don't save while there's any 'nofile' buffer open.
						if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
							return
						end
					end
					sm.save_current_session()
				end,
			})
		end,
	},
}
