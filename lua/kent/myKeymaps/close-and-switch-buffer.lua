local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

function Close_and_switch_buffer()
	local current_buffer = vim.api.nvim_get_current_buf()

	if vim.api.nvim_buf_get_option(current_buffer, "modified") then
		print("Buffer is modified, save it before closing!")
		return
	end

	local buffers = vim.api.nvim_list_bufs()
	local closest_buffer = nil

	local current_buffer_name = vim.api.nvim_buf_get_name(current_buffer)

	if current_buffer_name == "" then
		print("Current buffer is Alpha, open another buffer first!")
		return
	end

	for _, buf in ipairs(buffers) do
		if string.find(vim.api.nvim_buf_get_name(buf), "NvimTree") then
			-- skit loop for this time, if the buffer is NvimTree
			goto continue
		end

		if buf ~= current_buffer and vim.api.nvim_buf_is_loaded(buf) then
			closest_buffer = buf
		end

		::continue::
	end

	-- Switch to the closest buffer
	if closest_buffer then
		local next_buffer = vim.api.nvim_buf_get_name(closest_buffer)
		if next_buffer == "" then
			-- vim.cmd("Alpha")
			-- return
		end

		print("Switching to buffer: " .. vim.api.nvim_buf_get_name(closest_buffer))
		vim.api.nvim_set_current_buf(closest_buffer)
	else
		vim.cmd("Alpha")
		print("No more buffers to switch to!")
		return
	end

	vim.api.nvim_buf_delete(current_buffer, { force = true })

	if vim.api.nvim_buf_get_name(closest_buffer) == "" then
		vim.cmd("Alpha")
	end
end

keymap(
	"n",
	"<leader>w",
	":lua Close_and_switch_buffer()<CR>",
	{ noremap = true, silent = true, desc = "Close and switch buffer" }
)
