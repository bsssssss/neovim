return {
  "bsssssss/vim-tidal",
  enabled = false,
  config = function()
    vim.g.tidal_boot = "/Users/bss/Dropbox/bsupercollider/tidal/BootTidal.hs"
    vim.g.tidal_no_mappings = 1

    -- Create an autocommand group
    vim.api.nvim_create_augroup("TidalMappings", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = "TidalMappings",
      pattern = "tidal",
      callback = function()
        vim.keymap.set("n", "<leader>tds", ":TidalStart<CR>", { desc = "Tidal : [S]tart" })
        vim.keymap.set("n", "<leader>tdq", ":TidalQuit<CR>", { desc = "Tidal : [Q]uit" })
        vim.keymap.set("n", "<leader>tdr", ":TidalRestart<CR>", { desc = "Tidal : [R]estart" })
        vim.keymap.set("n", "<D-e>", "<Plug>TidalParagraphSend", { desc = "Tidal: [E]valuate" })
        vim.keymap.set("n", "<D-.>", ":TidalHush<CR>", { desc = "Tidal: Hush" })
        vim.keymap.set("i", "<D-e>", "<Esc><Plug>TidalParagraphSend<Esc>i<Right>")
        vim.keymap.set("i", "<D-.>", "<Esc>:TidalHush<CR><Esc>i<Right>")
      end,
    })
  end,
}
