vim.filetype.add({
	filename = {
		["kitty.conf"] = "kitty",
	},
	pattern = {
		[".*%.[sS]"] = "asm6502",
		[".*/kitty/.*%.conf"] = "kitty",
	},
})

require("bss.core")
require("bss.lazy")
-- require("bss.lspconfig")
