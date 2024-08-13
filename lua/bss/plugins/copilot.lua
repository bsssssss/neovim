return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = false,
				auto_trigger = false,
			},
		})
	end,
}
