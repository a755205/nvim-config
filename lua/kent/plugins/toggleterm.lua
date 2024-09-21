return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 80,
			-- open_mapping = [[<C-\>]], -- use this in office, macbook woth bluetooth keybord
			open_mapping = [[<D-l>]], -- work in my macbook, with command
			direction = "vertical", -- direction = 'vertical' | 'horizontal' | 'tab' | 'float' ,
			float_opts = {
				border = "single", -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open ]]
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "tab",
			display_name = "L.A.Z.Y.G.I.T",
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
	end,
}
