return {
	"rockyzhang24/arctic.nvim",
	branch = "v2",
	dependencies = { "rktjmp/lush.nvim" },
	priority = 1000,
	init = function()
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "#282a2e" })
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1D1E21" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282a2e" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		-- You can configure highlights by doing something like:
		-- vim.cmd.hi("Comment gui=none")
		vim.cmd([[
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none
    ]])
	end,
}
