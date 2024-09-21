return {
	"dhruvasagar/vim-table-mode",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>tm", "<cmd>TableModeToggle<CR>", {
			noremap = true,
			silent = true,
			desc = "TableMode Toggle",
		})
	end,
}
