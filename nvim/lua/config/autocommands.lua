local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Close quickfix on item choose
-- vim.api.nvim_create_autocmd(
--   "FileType", {
--   pattern={"qf"},
--   command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})

