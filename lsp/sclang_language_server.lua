return {
    -- from https://github.com/scztt/LanguageServer.quark
    cmd = {
        "sc-language-server",
        "--log-file", "/tmp/sc_language_server.log",
        "--verbose",
        "--", -- indicates the args that follow are to be passed to sclang
        "-u", "57300", -- e.g. custom UDP listening port for sclang
        "-l", "/Users/bss/.config/SuperCollider/sclang_lsp_conf.yaml", -- e.g. full path to config file
    },

    filetypes = { "supercollider" },
    -- root_dir = function(fname)
    --     return "/"
    -- end,
    settings = {},
}
