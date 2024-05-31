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
			-- [dracula] Color Palette
			-- Palette	Hex	RGB	HSL	Color Picker Boxes
			-- Background	#282a36	40 42 54	231° 15% 18%	Background Color
			-- Current Line	#44475a	68 71 90	232° 14% 31%	Current Line Color
			-- Selection	#44475a	68 71 90	232° 14% 31%	Selection Color
			-- Foreground	#f8f8f2	248 248 242	60° 30% 96%	Foreground Color
			-- Comment	#6272a4	98 114 164	225° 27% 51%	Comment Color
			-- Cyan	#8be9fd	139 233 253	191° 97% 77%	Cyan Color
			-- Green	#50fa7b	80 250 123	135° 94% 65%	Green Color
			-- Orange	#ffb86c	255 184 108	31° 100% 71%	Orange Color
			-- Pink	#ff79c6	255 121 198	326° 100% 74%	Pink Color
			-- Purple	#bd93f9	189 147 249	265° 89% 78%	Purple Color
			-- Red	#ff5555	255 85 85	0° 100% 67%	Red Color
			-- Yellow	#f1fa8c	241 250 140	65° 92% 76%	Yellow Color
			dracula = {
				bg = "#282a36",
				fg = "#f8f8f2",
				yellow = "#f1fa8c",
				cyan = "#8be9fd",
				darkblue = "#44475a",
				green = "#50fa7b",
				orange = "#ffb86c",
				violet = "#bd93f9",
				magenta = "#ff79c6",
				blue = "#6272a4",
				red = "#ff5555",
				pink = "#ff79c6",
				purple = "#bd93f9",
				comment = "#6272a4",
				selection = "#44475a",
				current_line = "#44475a",
			},
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
				-- lualine_a = { "mode" },
				lualine_a = {
					{
						"mode",
					},
				},
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

					{
						"diagnostics",
						color = {
							fg = colors.dracula.fg,
							bg = colors.dracula.selection,
						},
					},
					-- {
					-- 	"diff",
					-- 	color = {
					-- 		fg = colors.dracula.fg,
					-- 		bg = colors.dracula.selection,
					-- 	},
					-- },
					{
						"encoding",
						color = {
							fg = colors.dracula.fg,
							bg = colors.dracula.bg,
						},
					},
				},
				lualine_y = {
					{
						"filetype",
						color = {
							fg = colors.dracula.fg,
							bg = colors.dracula.selection,
						},
					},
				},
				lualine_z = {
					{
						"progress",
						color = {
							fg = colors.dracula.fg,
							bg = colors.dracula.bg,
						},
					},
				},
			},
		})
	end,
}
