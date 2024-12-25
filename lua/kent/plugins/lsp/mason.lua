return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_registry = require("mason-registry")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- TODO: 要記得手動安裝 eslint-lsp@4.8.0
		-- TODO: 要記得手動安裝 eslint-lsp@4.8.0
		-- TODO: 要記得手動安裝 eslint-lsp@4.8.0
		--
		-- :MasonInstall eslint-lsp@4.8.0

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pening = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"eslint",
				-- "volar",
				"volar@1.8.27", -- vue3在這個版本以上會有問題ㄝ, 所以要指定版本為1.8.27, 猜測是因為要適應typescript, 專案用ts的話可以不用指定版本
				-- [volar@1.8.27]參考自 https://github.com/vuejs/language-tools/issues/3925#issuecomment-1974779443
        "vtsls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint",
				"htmlhint",
			},
		})
	end,
}
