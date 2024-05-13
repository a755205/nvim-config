local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
--[[ vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) ]]

keymap("n", "<leader>pv", ":vim.cmd.Ex<CR>", { noremap = true, silent = true })

-- Navigate buffers
keymap("n", "<D-]>", ":bnext<CR>", opts)
keymap("n", "<D-[>", ":bprevious<CR>", opts)

-- Visual Line Mode 下多行移動
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- 行合併時游標會方在行首，不會跟著移動
keymap("n", "J", "mzJ`z", opts)

-- 游標控制（移動時置中）
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- 游標控制（搜尋時置中）
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- 選取時貼上不會蓋上新的register, 第一次貼上要用leader p
keymap("x", "<leader>p", '"_dP', opts)
--
-- 更改游標下的單字in buffer
-- 改用 vim spectre
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
-- vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
-- 	desc = "Toggle Spectre",
-- })
-- vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
-- 	desc = "Search current word",
-- })
-- vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
-- 	desc = "Search current word",
-- })
-- vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
-- 	desc = "Search on current file",
-- })

-- leader s for save
keymap("n", "<leader>s", "<cmd>w<CR>", opts)

-- local opts = { noremap = true, silent = true }

keymap("i", "<D-s>", "<cmd>w<CR>", opts)
keymap("n", "<D-s>", "<cmd>w<CR>", opts)

keymap("n", "<leader>q", ":qa<CR>", opts)

--[[ vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") ]]
--[[ vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) ]]

--移除方向鍵
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- 存擋
keymap("n", "<D-s>", ":w<CR>", opts)

-- window管理
-- keymap("n", "<leader>wv", ":vsplit<CR>", opts)
-- keymap("n", "<leader>ws", ":split<CR>", opts)

-- vim modify xml tag to other tag
keymap("n", "<leader>mt", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>", opts)

-- kent's custom keymap use function
require("kent/myKeymaps")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "Trouble" })
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble workspace_diagnostics" })
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble document_diagnostics" })
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "Trouble quickfix" })
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "Trouble loclist" })
vim.keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end, { desc = "Trouble lsp_references" })
