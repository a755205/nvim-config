return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		local keymap = vim.keymap

		-- add a new entry to the list of projects
		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[harpoon] Add a new entry to the list of projects" })
		-- remove an entry from the list of projects //is will takeover by telescope
		-- keymap.set("n", "<C-e>", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)

		-- remove list of projects
		-- keymap.set("n", "<leader>r", function()
		-- 	harpoon:list():remove()
		-- end, { desc = "[harpoon] Remove an entry from the list of projects" })

		keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
