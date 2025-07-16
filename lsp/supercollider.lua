return {
	cmd = {
		"sc-language-server",
		"--log-file",
		"/tmp/sc_lsp_output.log",
		"--verbose",
		-- "--receive-port",
		-- "57301",
		-- "--send-port",
		-- "57300",
		"--", -- indicates the args that follow are to be passed to sclang
		"-u",
		"57300", -- e.g. custom UDP listening port for sclang
		-- "57110", -- e.g. custom UDP listening port for sclang
		-- "-l",
		-- "/Users/bss/Library/Application Support/SuperCollider/sclang_conf.yaml", -- e.g. full path to config file
	},
	filetypes = { "supercollider" },
	-- root_dir = function(fname)
	-- 	return "/"
	-- end,
	settings = {},
}
