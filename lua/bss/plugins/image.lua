return {
	{
		"3rd/image.nvim",
    lazy = false,
		opts = {
			backend = "kitty", -- or "ueberzug"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = 100,
			max_height_window_percentage = 100,
			hijack_file_patterns = { "*.svg", "*.png" },
		},
	},
}
