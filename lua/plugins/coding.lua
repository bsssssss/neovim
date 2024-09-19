return {
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { silent = true, desc = "Toggle Undo Tree" })
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
