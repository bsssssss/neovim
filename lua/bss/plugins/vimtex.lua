return {
	"lervag/vimtex",
	enabled = false,
	init = function()
		-- vim.g['vimtex_view_method'] = 'skim'     -- main variant with xdotool (requires X11; not compatible with wayland)
		vim.g["vimtex_view_method"] = "skim" -- for variant without xdotool to avoid errors in wayland
		vim.g["vimtex_view_general_viewer"] = "skim"
		vim.g["vimtex_quickfix_mode"] = 0 -- suppress error reporting on save and build
		vim.g["vimtex_mappings_enabled"] = 1 -- Ignore mappings
		vim.g["vimtex_indent_enabled"] = 0 -- Auto Indent
		vim.g["tex_flavor"] = "latex" -- how to read tex files
		vim.g["tex_indent_items"] = 0 -- turn off enumerate indent
		vim.g["tex_indent_brace"] = 0 -- turn off brace indent
		vim.g["vimtex_context_pdf_viewer"] = "skim" -- external PDF viewer run from vimtex menu command
		vim.g["vimtex_log_ignore"] = { -- Error suppression:
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
		}
		vim.g["vimtex_compiler_latexmk"] = {
			continuous = 1, -- Enable continuous mode
			background = 1, -- Run in background
			-- out_dir = "build",
		}

		-- vim.api.nvim_create_autocmd("BufWritePost", {
		-- 	pattern = "*.tex",
		-- 	callback = function()
		-- 		vim.cmd("VimtexCompile")
		-- 	end,
		-- })
	end,
}
