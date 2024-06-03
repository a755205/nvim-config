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

		local ls = require("luasnip")
	end,
}
