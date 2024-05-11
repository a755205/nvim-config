local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- { 
	-- 	'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'},
	-- },
	"nvim-treesitter/nvim-treesitter",
	"williamboman/mason.nvim",
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",

		}
	},
	{ 'rose-pine/neovim', name = 'rose-pine' },

	-- lsp
	
	--- Uncomment these if you want to manage LSP servers from neovim
	{'williamboman/mason-lspconfig.nvim'},

	{"VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

}

local opts = {}

require("lazy").setup(plugins, opts)

