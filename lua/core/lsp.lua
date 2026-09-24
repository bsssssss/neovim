vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
            foldingRange = {
                lineFoldingOnly = true,
            },
        },
    },
    root_markers = { ".git" },
})

vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "emmet_ls",
    "hls",
    "texlab",
    "ts_ls",
    "lemminx",
    "marksman",
    "sclang_language_server",
    "genexpr_language_server",
    "vimls",
    "jdtls",
    "ruff",
    "pyright"
    -- "sclang_lint",
    -- "tidal_language_server",
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
