if not os.getenv("TMUX") then
  return
end

-- Fix "Press Enter" bug with tmux splits
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "silent! redraw!"
})
