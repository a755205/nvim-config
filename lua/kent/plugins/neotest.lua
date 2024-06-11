return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest", -- add vitest
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					-- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
					filter_dir = function(name, rel_path, root)
						local full_path = root .. "/" .. rel_path

						if root:match("projects/my-large-monorepo") then
							if full_path:match("^unit_tests") then
								return true
							else
								return false
							end
						else
							return name ~= "node_modules"
						end
					end,
				}),
			},
		})
		-- set keymap
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap

		-- keymap run all tests
		opts.desc = "Run test"
		-- vim.api.nvim_set_keymap(
		--     "n",
		--     "<leader>twr",
		--     "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
		--     {desc = "Run Watch"}
		-- )

		-- vim.api.nvim_set_keymap(
		--     "n",
		--     "<leader>twf",
		--     "<cmd>lua require('neotest').run.run({ vim.fn.expand("%"), vitestCommand = 'vitest --watch' })<cr>",
		--     {desc = "Run Watch File"}
		-- )
		keymap(
			"n",
			"<leader>tvw",
			"<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
			opts
		)
	end,
}
