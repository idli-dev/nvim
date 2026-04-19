local api = vim.api
-- Helpers
local function augroup(name)
	return api.nvim_create_augroup("User_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("comment_line"),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = augroup("yank_highlight"),
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Restore cursor position
api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = api.nvim_buf_get_mark(0, '"')
		local line_count = api.nvim_buf_line_count(0)

		if mark[1] > 0 and mark[1] <= line_count then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
	group = augroup("trim_whitespace"),
	callback = function()
		local view = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(view)
	end,
})
