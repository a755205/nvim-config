local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

function close_and_switch_buffer()
	local current_buffer = vim.api.nvim_get_current_buf()

	if vim.api.nvim_buf_get_option(current_buffer, "modified") then
		print("Buffer is modified, save it before closing!")
		return
	end

	local buffers = vim.api.nvim_list_bufs()
	local closest_buffer = nil

	for _, buf in ipairs(buffers) do
		if string.find(vim.api.nvim_buf_get_name(buf), "NvimTree") then
			-- skit loop for this time
			goto continue
		end

		if buf ~= current_buffer and vim.api.nvim_buf_is_loaded(buf) then
			closest_buffer = buf
		end

		::continue::
	end

	-- Switch to the closest buffer
	if closest_buffer then
		-- print("Switching to buffer: " .. vim.api.nvim_buf_get_name(closest_buffer))
		vim.api.nvim_set_current_buf(closest_buffer)
	else
		print("No more buffers to switch to!")
	end

	-- Delete the current buffer
	vim.api.nvim_buf_delete(current_buffer, { force = true })
end

keymap("n", "<leader>w", ":lua close_and_switch_buffer()<CR>", opts)
