return {
	{
		"nvim-java/nvim-java",
		enabled = true,
    lazy = true,
    config = function ()
      vim.keymap.set("n", "<leader>Jr", "<cmd>JavaRunnerRunMain<CR>", { desc = "Java: Run" })
    end
	},
}
