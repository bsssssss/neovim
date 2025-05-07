return {
	"heittpr/p5.vim",
	-- Important: Don't lazy-load rplugins
	lazy = false,
	-- Run after installation/update
	build = function()
		vim.cmd("UpdateRemotePlugins")
	end,
}
