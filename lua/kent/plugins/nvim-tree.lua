return {
	-- doc [[ https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/ ]]
	"nvim-tree/nvim-tree.lua",
	dependincies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local nvimtree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- 默认映射
			api.config.mappings.default_on_attach(bufnr)

			-- 自定义映射
			--[[ vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up')) ]]
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

			-- 添加 'l' 作为打开文件或目录的映射
			vim.keymap.set("n", "l", api.node.open.edit, opts("Edit"))
		end

		-- OR setup with some options
		nvimtree.setup({
			on_attach = my_on_attach,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 50,
				-- relativenumber = true,
				side = "left",
			},
			renderer = {
				-- group_empty = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = {
					"!.git",
					".DS_Store",
				},
			},
			git = {
				ignore = false,
			},
		})

		local keymap = vim.keymap

		function FocusNvimTree()
			local view = require("nvim-tree.view")

			if view.is_visible() then
				view.focus()
			else
				require("nvim-tree").toggle()
			end
		end

		-- 開關nvim-tree
		vim.api.nvim_set_keymap("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

		-- 在buffer中打开nvim-tree後，會指向結構下的這個buffer檔案
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle file explorer on current file" }
		)

		-- 把樹狀都關掉
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ec",
			"<cmd>NvimTreeCollapse<CR>",
			{ noremap = true, silent = true, desc = "Collapse the tree" }
		)

		-- 刷新nvim-tree
		vim.api.nvim_set_keymap(
			"n",
			"<leader>er",
			"<cmd>NvimTreeRefresh<CR>",
			{ noremap = true, silent = true, desc = "Refresh the tree" }
		)
	end,
}
