return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			-- require('telescope').setup{
			--   defaults = {
			--     layout_strategy = 'vertical',
			--     layout_config = { height = 0.95 },
			--   },
			-- }

			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { height = 0.99, width = 0.99 },
					path_display = { "truncate " },
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous, -- move to prev result
							["<S-j>"] = actions.move_selection_next, -- move to next result
							["<S-D-k>"] = actions.preview_scrolling_up, -- preview scroll up
							["<S-D-j>"] = actions.preview_scrolling_down, -- preview scroll down
						},
					},
				},
			})

			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			local keymap = vim.keymap

			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd 尋找檔案" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffers" })
			keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help tags" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find all todos" })
			keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Find all todos" })

			-- find string in files
			keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd 尋找字串 " })
			-- find word file and path both
			keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String under cursor" })

			--show keymaps
			keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Fuzzy find keymaps" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
