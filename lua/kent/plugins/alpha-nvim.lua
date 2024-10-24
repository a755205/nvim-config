-- import   ascii art  from lua/kent/assets/ascii-art.lua
local asciiArt = require("kent.assets.ascii-art")

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- base on size of terminal to set defferent ascii art function
		-- local width = vim.api.nvim_get_option("columns")

		-- declare function
		local function setAsciiArt()
			print(vim.api.nvim_get_option("columns"))
			if vim.api.nvim_get_option("columns") > 150 then
				return asciiArt.anime.claymore2
			else
				return asciiArt.anime.rickAndMorty
			end
		end

		-- Set header
		-- dashboard.section.header.val = asciiArt.anime.claymore2
		dashboard.section.header.val = setAsciiArt()

		dashboard.section.buttons.val = {
			dashboard.button("r", "   Recently opened files", ":Telescope oldfiles<CR>"),
			dashboard.button("n", "   NvimTree", ":NvimTreeToggle<CR>"),
			dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
			-- // button to active NvimTree
			-- dashboard.button("s", "   Find word", ":Telescope live_grep<CR>"),
			-- dashboard.button("q", "   Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
