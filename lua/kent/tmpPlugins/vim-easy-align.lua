-- example from
-- https://github.com/junegunn/vim-easy-align
return {
	"junegunn/vim-easy-align",
	config = function()
		vim.cmd([[
      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)
    ]])
	end,
}

-- Usage
-- [vipga=]  : Align on =
-- [gaip=]   : Align on = with inner paragraph

-- try this
--
--[[
apple   =red
grass+=green
sky-=   blue
]]
