return {
	"rockyzhang24/arctic.nvim",
	branch = "v2",
	dependencies = { "rktjmp/lush.nvim" },
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("arctic")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
}
