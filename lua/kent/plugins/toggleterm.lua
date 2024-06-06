return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 20,
			-- open_mapping = [[<leader>t]],
			direction = "tab", -- direction = 'vertical' | 'horizontal' | 'tab' | 'float' ,
			float_opts = {
				border = "single", -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open ]]
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gg",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ noremap = true, silent = true, desc = "[Lazygit]" }
		)
	end,
}
