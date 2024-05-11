-- :help options

opt = vim.opt
cmd = vim.cmd
api = vim.api

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
opt.cursorline = false -- 游標行線, highlight the current line
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
--[[ opt.colorcolumn = "80" ]]

opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- 禁用 nvim-notify
vim.g.notify_on_action = 0
