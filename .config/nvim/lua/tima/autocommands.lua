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
]]

-- visual select every time you yank
--     autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 

