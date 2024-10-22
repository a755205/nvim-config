return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local neovim = {
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
		}

		local doom = {

			[[=================     ===============     ===============   ========  ========]],
			[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
			[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
			[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
			[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
			[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
			[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
			[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
			[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
			[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
			[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
			[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
			[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
			[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
			[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
			[[||.=='    _-'                                                     `' |  /==.||]],
			[[=='    _-'                        N E O V I M                         \/   `==]],
			[[\   _-'                                                                `-_   /]],
			[[ `''                                                                      ``' ]],
		}

		local rickandmorty = {

			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⡄⠀⠉⠉⠉⠉⠛⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⠿⠿⠟⣻",
			"⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠒⠚⠉⠉⠉⠉⠉⠉⠉⠙⠒⠦⣀⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⣰⣿",
			"⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⣠⣾⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠰⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⠀⠀⡎⠀⠀⠀⠀⠀⣀⠤⠖⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠊⠈⠉⠉⠐⠒⠒⠺⢦⠀⠀⠙⠿⣿⣿⣿⣿",
			"⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠘⠧⠦⠤⠤⠤⠒⠒⠒⠶⡔⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠲⣿⡀⠀⠀⠀⠈⠙⠻⢿",
			"⡟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⠀⠀⠀⠀⠀⢀⣴",
			"⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⣧⠤⠤⢤⣤⡤⠤⠤⠤⠤⠤⠤⣇⣾⠤⠤⠤⣤⡔⠒⠒⠒⠦⠤⢾⠀⠀⢀⣤⣾⣿⣿",
			"⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⢸⠀⠀⠀⠘⡇⠀⠀⠀⠟⠀⠀⠀⠀⠀⠀⠀⡞⢱⠀⠀⠀⠛⠃⠀⠀⠀⠀⠀⢸⠀⣰⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⢸⠀⠀⠀⠀⠸⣄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⠁⠀⢣⡀⠀⠀⠀⠀⠀⠀⠀⣠⡇⠀⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠈⠑⠢⠤⠤⠤⠤⠤⠒⠉⠀⠀⠀⠀⣯⠓⠲⠤⠤⠔⠒⠉⣽⠁⠀⠈⠻⣿⣿⣿⣿",
			"⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⣸⣿⡄⠀⠀⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⢹⡀⠠⣄⣀⣀⠤⠞⣻⣄⠀⠀⠀⠈⠻⣿⣿",
			"⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠀⠀⠀⠀⠀⠸⡀⠀⠀⣇⠀⠀⠀⠀⠀⠀⣿⠈⢳⡀⣀⣠⣴⣾⣿",
			"⣿⣿⣿⣷⣶⣤⣄⣀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⣄⡴⠃⠀⠀⠀⠀⠀⠀⡇⠀⢸⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠹⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠤⣾⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠈⠓⠶⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⢲⠁⠀⠈⢿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣏⣀⣀⣀⣀⣀⣀⡀⢣⠀⠀⠀⢠⠟⠀⠀⣀⡤⠔⠊⠉⠉⠉⢹⣿⣿⣿⣿⡟⠑⠒⠤⡄⠘⡄⣶⣶⣾⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠈⣧⠀⠀⠸⡄⠀⠊⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠿⠃⠀⠀⠀⠀⣸⠃⠹⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠈⣆⠀⠀⠈⠲⠶⠆⠀⠀⠀⠀⢀⡀⠘⣿⡟⢡⣤⠀⠀⠀⠒⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠗⠀⠋⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠶⢤⣀⣀⠀⠀⠀⢀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠉⠉⠉⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠛⠋⠉⠉⠁⡄⠘⡷⢤⣀⣀⣀⣀⣠⠞⢻⠀⡀⠈⠉⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⡇⠀⠀⠀⠀⠀⠀⠀⠘⡄⢳⡀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⡸⠁⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢳⡀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿",
		}

		-- Set header
		dashboard.section.header.val = rickandmorty

		dashboard.section.buttons.val = {
			dashboard.button("r", "   Recently opened files", ":Telescope oldfiles<CR>"),
			dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
			dashboard.button("s", "   Find word", ":Telescope live_grep<CR>"),
			dashboard.button("q", "   Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
