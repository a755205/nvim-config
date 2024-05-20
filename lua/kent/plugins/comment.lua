return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			padding = true, -- Add a space b/w comment and line
			sticky = true, -- Whether the cursor should stay at its position when you comment out a line
			-- ignore = nil, -- list of filetypes to ignore
			-- ignore empty lines
			ignore = "^$",

			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---line-comment keymap
				line = "gcc",
				---block-comment keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true, -- toggle the line comment of the current line
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true, -- toggle a comment block spanning multiple lines
			},

			-- for commenting tsx and jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),
			---Function to call after (un)comment
			-- post_hook = nil,
			post_hook = function() end,
		})
	end,
}
