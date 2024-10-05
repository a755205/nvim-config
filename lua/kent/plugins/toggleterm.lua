return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 80,
			open_mapping = [[<C-\>]], -- use this in office, macbook woth bluetooth keybord
			-- open_mapping = [[<C-l>]], -- work in my macbook, with command
			-- open_mapping = [[<leader>to]], -- open or close terminal
			direction = "vertical", -- direction = 'vertical' | 'horizontal' | 'tab' | 'float' ,
			float_opts = {
				border = "single", -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open ]]
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		-- for [Lazygit]
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			display_name = "L.A.Z.Y.G.I.T",

			float_opts = {
				border = "curved",
				-- width = 80,
				-- height = 40,
			},
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>tg",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Lazygit" }
		)

		-- for execute nodejs index.js, path with vim oper dir
		local _node = Terminal:new({
			cmd = "node index.js",
			hidden = true,
			direction = "tab",
			display_name = "NodeJs",
			close_on_exit = false,
		})

		function _node_toggle()
			_node:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>trn",
			"<cmd>lua _node_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Run NodeJs In Current Path index.js" }
		)
	end,
}
