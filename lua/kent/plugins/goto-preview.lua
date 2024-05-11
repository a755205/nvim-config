return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({})

		vim.keymap.set("", "gpd", function()
			require("goto-preview").goto_preview_definition()
		end, { remap = true })

		vim.keymap.set("", "gpi", function()
			require("goto-preview").goto_preview_implementation()
		end, { remap = true })

		vim.keymap.set("", "gP", function()
			require("goto-preview").close_all_win()
		end, { remap = true })
	end,
}
