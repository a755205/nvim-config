-- :help options

opt = vim.opt
cmd = vim.cmd
api = vim.api

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

opt.number = true -- 啟動行數
opt.relativenumber = true -- 啟動相對行數
opt.clipboard = "unnamedplus" -- 允許vim訪問系統剪貼簿
opt.cmdheight = 1 -- 命令行高度 more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- 自動補全設定, mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = false -- highlight all matches on previous search pattern
opt.incsearch = true
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.smartcase = false -- smart case
opt.smartindent = true -- 自動縮排在「autoindent」的基礎上，針對「{」(左大括號)後所產生的新行，再多往內縮排一次
opt.splitbelow = true -- force all horizontal splits to go below current window--aaa AAA Bbb
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- 游標行線, highlight the current line
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- keymap("n", "<D-]>", ":bnext<CR>", opts)
--
-- keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd 尋找檔案" })

-- keymap("n", "<D-]>", ":bnext<CR>", opts)

opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l") --設定左右移動時可以跨行
vim.cmd([[set iskeyword+=-]]) -- 設定 - 為字串的一部分
vim.cmd([[set showtabline=0]]) -- 關閉tab
--

-- 禁用 nvim-notify
vim.g.notify_on_action = 0
