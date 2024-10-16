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
			-- green = "#98be65",
			-- orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			-- red = "#ec5f67",
			red = "#ca1243",
			grey = "#a0a1a7",
			black = "#383a42",
			white = "#f3f3f3",
			light_green = "#83a598",
			orange = "#fe8019",
			green = "#8ec07c",
			purple = "#bd93f9",
			dark_purple = "#5d4d7a",

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

		local theme = {
			normal = {
				a = { fg = colors.white, bg = colors.dark_purple },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.black },
				x = { fg = colors.white, bg = colors.black },
				y = { fg = colors.white, bg = colors.black },
				z = { fg = colors.white, bg = colors.black },
			},
			insert = { a = { fg = colors.black, bg = colors.light_green } },
			visual = { a = { fg = colors.black, bg = colors.orange } },
			replace = { a = { fg = colors.black, bg = colors.green } },
		}

		local empty = require("lualine.component"):extend()
		function empty:draw(default_highlight)
			self.status = ""
			self.applied_separator = ""
			self:apply_highlights(default_highlight)
			self:apply_section_separators()
			return self.status
		end

		-- Put proper separators and gaps between components in sections
		local function process_sections(sections)
			for name, section in pairs(sections) do
				local left = name:sub(9, 10) < "x"
				for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
					table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
				end
				for id, comp in ipairs(section) do
					if type(comp) ~= "table" then
						comp = { comp }
						section[id] = comp
					end
					comp.separator = left and { right = "" } or { left = "" }
				end
			end
			return sections
		end

		local function modified()
			if vim.bo.modified then
				return "+"
			elseif vim.bo.modifiable == false or vim.bo.readonly == true then
				return "-"
			end
			return ""
		end

		require("battery").setup({
			update_rate_seconds = 30, -- Number of seconds between checking battery status
			show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
			show_plugged_icon = false, -- If true show a cable icon alongside the battery icon when plugged in
			show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
			show_percent = false, -- Whether or not to show the percent charge remaining in digits
			vertical_icons = false, -- When true icons are vertical, otherwise shows horizontal battery icon
			multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
		})

		local diagnostics = {
			"diagnostics",
		}

		lualine.setup({
			options = {
				theme = theme,
				icons_enabled = false,
				section_separators = { left = "", right = "" },
			},
			sections = process_sections({
				lualine_a = {
					{
						"mode",
					},
				},
				lualine_b = {
					"branch",
				},
				lualine_c = {

					"diff",
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "error" },
						diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
					},
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "warn" },
						diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
					},
					{ "filename", file_status = false, path = 0 },
					{ modified, color = { bg = colors.red } },
					{
						"%w",
						cond = function()
							return vim.wo.previewwindow
						end,
					},
					{
						"%r",
						cond = function()
							return vim.bo.readonly
						end,
					},
					{
						"%q",
						cond = function()
							return vim.bo.buftype == "quickfix"
						end,
					},
					-- {
					-- 	"buffers",
					-- 	mode = 0,
					-- 	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
					-- 	use_mode_colors = false,
					-- 	buffers_color = {
					-- 		active = "lualine_a_normal", -- Color for active buffer.
					-- 		inactive = "lualine_a_inactive", -- Color for inactive buffer.
					-- 	},
					-- },
				},
				lualine_x = {},
				lualine_y = {
					-- "windows",
				},
				lualine_z = {

					{
						"filetype",
						-- color = {
						-- 	fg = colors.dracula.fg,
						-- 	bg = colors.dracula.bg,
						-- },
					},
					{ "encoding" },
					{ "location" },
					{ "progress" },
				},
			}),
		})
	end,
}
