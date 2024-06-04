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

			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "尋找檔案" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "尋找buffers" })
			keymap.set("n", "<leader>ft", builtin.help_tags, { desc = "Fuzzy find help tags" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近檔案" })
			keymap.set("n", "<leader>fn", "<cmd>TodoTelescope<cr>", { desc = "尋找TODO" })
			keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd 尋找字串 " })
			keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String under cursor" })
			keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Fuzzy find keymaps" })
			keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_document_diagnostics<cr>", { desc = "Show diagnostics" })

			-- harpoon
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				local make_finder = function()
					local paths = {}

					for _, item in ipairs(harpoon_files.items) do
						table.insert(paths, item.value)
					end

					return require("telescope.finders").new_table({
						results = paths,
					})
				end

				local finder = function()
					local paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(paths, item.value)
					end

					return require("telescope.finders").new_table({
						results = paths,
					})
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = finder(),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
						attach_mappings = function(prompt_bufnr, map)
							local remove_item = function()
								local state = require("telescope.actions.state")
								local selected_entry = state.get_selected_entry()
								local current_picker = state.get_current_picker(prompt_bufnr)

								table.remove(harpoon_files.items, selected_entry.index)
								current_picker:refresh(finder())
							end

							local mapOptions = { noremap = true, silent = true }

							mapOptions["desc"] = "Remove item from harpoon list in normal mode"
							map("n", "x", remove_item, mapOptions)

							mapOptions["desc"] = "Remove item from harpoon list in insert mode"
							map("i", "<C-x>", remove_item, mapOptions)

							return true
						end,
					})
					:find()
			end

			keymap.set("n", "<leader>fh", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })

			keymap.set("n", "<C-e>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
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
