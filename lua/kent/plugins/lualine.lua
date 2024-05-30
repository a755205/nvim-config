return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"justinhj/battery.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"nvim-lua/plenary.nvim",
			},
		},
	},
	opts = {},
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "#282c34",
			fg = "#abb2bf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67",
		}

		require("battery").setup({
			update_rate_seconds = 30, -- Number of seconds between checking battery status
			show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
			show_plugged_icon = false, -- If true show a cable icon alongside the battery icon when plugged in
			show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
			show_percent = false, -- Whether or not to show the percent charge remaining in digits
			vertical_icons = false, -- When true icons are vertical, otherwise shows horizontal battery icon
			multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
		})
		-- plubin [battery]
		local battery = {
			function()
				return require("battery").get_status_line()
			end,
			color = {
				fg = colors.violet,
				-- bg = colors.bg
			},
		}
		lualine.setup({
			options = {
				icons_enabled = false,
				-- theme = "nightfly", -- gruvbox, dracula, nightfly
				component_separators = { left = "", right = " " },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"buffers",
						mode = 0,
						max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
						use_mode_colors = false,
						buffers_color = {
							active = "lualine_a_normal", -- Color for active buffer.
							inactive = "lualine_a_inactive", -- Color for inactive buffer.
						},
					},
				},
				lualine_x = {

					-- { "filename", path = 4 },
					-- { "tabs", path = 1, mode = 1 },

					"diagnostics",
					"diff",
					"encoding",
					-- "fileformat",
					-- battery,
					"filetype",
				},
				lualine_y = { "progress" },
				-- lualine_z = { "location", "os.date('%H:%M')" },
			},
		})
	end,
}
