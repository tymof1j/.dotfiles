vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd InsertEnter * norm zz

    autocmd BufReadPost *.html setlocal shiftwidth=2
    autocmd BufReadPost *.html setlocal tabstop=2
    autocmd BufReadPost *.css setlocal shiftwidth=2
    autocmd BufReadPost *.css setlocal tabstop=2
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _file_run
    autocmd BufReadPost *.py nnoremap <leader>r :wa <bar> :! python3 % <cr>
    autocmd BufReadPost *.rb nnoremap <leader>r :wa <bar> :! ruby % <cr>
  augroup end
]]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- local file_group = augroup('FileType', {})

-- autocmd({ 'BufRead', 'BufNewFile' }, {
--   group = file_group,
--   pattern = { '*.txt', '*.md', '*.gitcommit' },
--   command = 'setlocal spell'
-- })

autocmd('BufWritePre', {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

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
