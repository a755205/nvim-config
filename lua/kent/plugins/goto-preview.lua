return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({})

		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap

		opts.desc = "Goto Preview Definition"
		keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)

		opts.desc = "Goto Preview Type Definition"
		keymap("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)

		opts.desc = "Goto Preview Type Definition"
		keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)

		opts.desc = "Goto Preview Declaration"
		keymap("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", opts)

		opts.desc = "Close All Windows"
		keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)

		opts.desc = "Goto Preview References"
		keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
	end,
}
