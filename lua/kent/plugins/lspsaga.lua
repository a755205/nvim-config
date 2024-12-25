-- lspsaga
return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = false,
				-- hide_keyword = false,
				-- show_file = true,
				-- folder_level = 1,
				-- color_mode = true,
				-- delay = 300,
			},
			lightbulb = {
				enable = false,
				sign = true,
				debounce = 10,
				sign_priority = 40,
				virtual_text = true,
				enable_in_insert = true,
				ignore = {
					clients = {},
					ft = {},
				},
			},
			diagnostic = {
				show_layout = "float",
				show_normal_height = 10,
				jump_num_shortcut = true,
				auto_preview = false,
				max_width = 0.8,
				max_height = 0.6,
				max_show_width = 0.9,
				max_show_height = 0.6,
				wrap_long_lines = true,
				extend_relatedInformation = false,
				diagnostic_only_current = false,
				keys = {
					exec_action = "o",
					quit = "q",
					toggle_or_jump = "<CR>",
					quit_in_show = { "q", "<ESC>" },
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = false,
				extend_gitsigns = false,
				only_in_cursor = true,
				max_height = 0.3,
				cursorline = true,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "gr", "<Cmd>Lspsaga finder<CR>", { desc = "[lspsaga] References" })
		keymap.set("n", "gpd", "<Cmd>Lspsaga peek_definition<CR>", { desc = "[lspsaga] Peek Definition " })
		keymap.set("n", "gpt", "<Cmd>Lspsaga peek_type_definition<CR>", { desc = "[lspsaga] Peek Type Definition " })
		keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", { desc = "[lspsaga] Hover " })
		keymap.set("n", "ghh", "<Cmd>Lspsaga hover_doc ++keep<CR>", { desc = "[lspsaga] Hover Hold Right There " })
		keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", { desc = "[lspsaga] Code Action " })
		keymap.set("n", "grm", "<Cmd>Lspsaga rename<CR>", { desc = "[lspsaga] Rename" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
