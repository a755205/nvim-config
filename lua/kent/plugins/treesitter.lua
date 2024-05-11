return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"typescript",
				"rust",
				"vue",
				"css",
				"json",
				"scss",
				"yaml",
				"markdown",
				"sql",
			},
			sync_install = false,
			highlight = { enable = false },
			indent = { enable = true },
		})
	end,
}
