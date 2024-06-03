return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "latte", -- latte, frappe, macchiato, mocha
	},
	config = function(_, opts)
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = function(colors)
				return {
					Comment = { bg = colors.none },
					-- Custom highlights
					-- For example:
					-- { "Comment", cterm = "italic" },
					-- { "Conditional", guifg = "#ff0000" },
					-- { "Function", guifg = "#ff0000" },
					-- { "Keyword", guifg = "#ff0000" },
					-- { "String", guifg = "#ff0000" },
					-- { "Variable", guifg = "#ff0000" },
					-- { "Number", guifg = "#ff0000" },
					-- { "Boolean", guifg = "#ff0000" },
					-- { "Property", guifg = "#ff0000" },
					-- { "Type", guifg = "#ff0000" },
					-- { "Operator", guifg = "#ff0000" },
					-- { "Error", guifg = "#ff0000" },
					-- { "Warning", guifg = "#ff0000" },
					-- { "Information", guifg = "#ff0000" },
					-- { "Hint", guifg = "#ff0000" },
				}
			end, -- Custom user highlights
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		--[[ vim.cmd.colorscheme "catppuccin" ]]

		vim.cmd([[colorscheme catppuccin]])
	end,
}
