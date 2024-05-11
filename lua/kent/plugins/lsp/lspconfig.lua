return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} }, -- new
		{ "folke/neoconf.nvim" }, -- new
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local default_servers = {
			"volar",
		}

		mason_lspconfig.setup_handlers({
			function(server_name)
				-- -- lspconfig[server_name].setup({
				-- -- 	capabilities = capabilities,
				-- -- })
				local server_config = {}
				if require("neoconf").get(server_name .. ".disable") then
					return
				end
				if server_name == "volar" then
					server_config.filetypes = { "vue", "typescript", "javascript" }
				end
				lspconfig[server_name].setup(server_config)
				-- if server_name == "volar" then
				--       {filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }}
				-- end
			end,
			-- ["volar"] = function()
			-- 	lspconfig["volar"].setup({
			-- 		capabilities = capabilities,
			-- 		on_attach = on_attach,
			-- 		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			-- 		init_options = {
			-- 			hybirdMode = false,
			-- 		},
			-- 	})
			-- end,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html" },
		})

		-- new configure vuels server with plugin

		-- new configure vtsls server with plugin
		-- lspconfig["volar"].setup({
		-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	init_options = {
		-- 		vue = {
		-- 			hybirdMode = false,
		-- 		},
		-- 	},
		-- })

		-- configure typescript server with plugin
		-- TODO: 要對js or ts 檔案啟動lsp, 需要先安裝typescript-language-server ,注意是全域安裝
		-- TODO: 要對js or ts 檔案啟動lsp, 需要先安裝typescript-language-server ,注意是全域安裝
		-- TODO: 要對js or ts 檔案啟動lsp, 需要先安裝typescript-language-server ,注意是全域安裝
		-- npm install -g typescript-language-server typescript
		-- npm i -g @vue/typescript-plugin
		-- lspconfig["tsserver"].setup({
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"typescript",
		-- 		-- "typescriptreact",
		-- 		-- "typescript.tsx",
		-- 		"vue",
		-- 	},
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	init_options = {
		-- 		-- if you are using node version manager (nvm),
		-- 		-- your global node modules will be stored under whatever version of node you are using at the time you saved the module.
		-- 		-- So ~/.nvm/versions/node/{version}/lib/node_modules/.
		-- 		plugins = {
		-- 			{
		-- 				name = "@vue/typescript-plugin",
		-- 				location = os.getenv("HOME")
		-- 					.. ".nvm/versions/node/v20.12.2/lib/node_modules/@vue/typescript-plugin",
		-- 				languages = { "typescript", "vue", "javascript" },
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- new configure javascript server with plugin
		-- eslint-language-server
		-- lspconfig["eslint-language-server"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- new configure quick_lint_js server with plugin
		lspconfig["quick_lint_js"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		-- lspconfig["svelte"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = function(client, bufnr)
		-- 		on_attach(client, bufnr)
		--
		-- 		vim.api.nvim_create_autocmd("BufWritePost", {
		-- 			pattern = { "*.js", "*.ts" },
		-- 			callback = function(ctx)
		-- 				if client.name == "svelte" then
		-- 					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		-- 				end
		-- 			end,
		-- 		})
		-- 	end,
		-- })
		--
		-- configure prisma orm server
		-- lspconfig["prismals"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure graphql language server
		-- lspconfig["graphql"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		-- })

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "vue", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		-- lspconfig["pyright"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
