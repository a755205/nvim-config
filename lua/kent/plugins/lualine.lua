return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	opts = {
		options = {
			icons_enabled = false,
			theme = "nightfly",
			component_separators = "|",
			section_separators = "",
		},
	},

	config = function()
		-- import comment plugin safely
		local lualine = require("lualine")

		-- enable comment
		lualine.setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", file_status = true, path = 1 },
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
