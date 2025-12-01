-- LSP --

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_hover) then
            map("K", function()
                vim.lsp.buf.hover({
                    border = "single",
                })
            end, "Hover")
        end

        if
            client
            and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
        then
            local highlight_augroup =
                vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

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
                    vim.api.nvim_clear_autocmds({
                        group = "lsp-highlight",
                        buffer = event2.buf,
                    })
                end,
            })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentColor) then
            vim.lsp.document_color.enable(true, 0, {
                style = 'virtual'
            })
        end

    end,
})

-- OTHER --

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "qf" },
    desc = "Keymap to close help/qf window",
    callback = function()
        vim.keymap.set("n", "q", ":bd<CR>", { buffer = true, desc = "Close help/qf split window" })
    end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "help",
--     desc = "Open help in a vertical split",
--     callback = function ()
--         vim.cmd("wincmd L")
--     end
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "LspReferenceText", timeout = 150 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { "gitcommit", "markdown", "md" },
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = false
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.conceallevel = 0
    end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "haskell", "c", "java" },
--  callback = function()
--      local bufnr = vim.api.nvim_get_current_buf()
--      vim.bo[bufnr].tabstop = 4
--      vim.bo[bufnr].softtabstop = 4
--      vim.bo[bufnr].shiftwidth = 4
--  end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "lua", "json", "html" },
--  callback = function()
--      local bufnr = vim.api.nvim_get_current_buf()
--      vim.bo[bufnr].tabstop = 2
--      vim.bo[bufnr].softtabstop = 2
--      vim.bo[bufnr].shiftwidth = 2
--  end,
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "max",
    callback = function()
        vim.cmd("set filetype=json")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "supercollider",
    callback = function()
        vim.opt_local.expandtab = false
    end,
})
