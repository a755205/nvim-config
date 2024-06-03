return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	-- event = "VeryLazy",
	config = function()
		-- require luaSnip for each filetype
		require("kent.snips.lua")
		require("kent.snips.javascript")

		-- set keybindings to jump forward and backward
		vim.api.nvim_set_keymap(
			"i",
			"<C-j>",
			'<cmd>lua require("luasnip").jump(1)<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"i",
			"<C-k>",
			'<cmd>lua require("luasnip").jump(-1)<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
