vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    -- root_markers = { ".git" },
})

vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "bashls",
    "clangd",
    "cmake",
    "html",
    "tailwindcss",
    "cssls",
    -- "emmet_language_server",
    -- "hls",
    "texlab",
    "ts_ls",
    "lemminx",
    "marksman",
    "supercollider",
    "tidal_language_server",
    "vimls",
    "hyprls",
    "racket_langserver",
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
