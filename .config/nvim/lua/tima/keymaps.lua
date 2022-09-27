local opts = { noremap = true, silent = true }
-- map the leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap('<leader>w', ':w<cr>')

-- Quickly insert an empty new line without entering insert mode
nmap('<Leader>o', 'o<Esc>0')
nmap('<Leader>O', 'O<Esc>0')

-- Toggle spell check
nmap('<leader>c', ':setlocal spell!<cr>')

-- for fugitive
nmap('<leader>gn', ':diffget //3<cr>')
nmap('<leader>gt', ':diffget //2<cr>')
nmap('<leader>gs', ': G<cr>')
nmap('<leader>gl', ': G log<cr>')
nmap('<leader>gc', ': G commit<cr>')
nmap('<leader>gp', ': G push<cr>')


-- for telecsope:
nmap('<leader>f', ':Telescope find_files <cr>')
nmap('<leader>t', ':Telescope live_grep <cr>')
nmap('<leader>b', '<cmd>Telescope buffers<cr>')


-- for tabs
nmap('tn', ':tabnew<cr>')
nmap('tc', ':tabclose<cr>')
nmap('tg', ':tabprev<cr>')
nmap('to', ':tabo<cr>')


-- for spits
nmap('<leader>n', ':NvimTreeToggle<cr>') -- nerd tree
nmap('<leader>mm', ':MaximizerToggle<cr>') -- toggle maximize for split/recover
nmap('<leader>eq', '<C-w>=') -- equalize size of splits
-- better moving management:
nmap('<leader>h', ':wincmd h <cr>')
nmap('<leader>j', ':wincmd j <cr>')
nmap('<leader>k', ':wincmd k <cr>')
nmap('<leader>l', ':wincmd l <cr>')

-- nmap('S', '<Plug>(findandreplace_n)')
nmap('<leader>vr', ':source %<cr>') -- source config if you are currently viewing him

-- formatting
nmap('<leader>a', ':lua vim.lsp.buf.formatting_sync()<cr>')

-- vim-rails:
nmap('<leader>em', ':Emodel<cr>')
nmap('<leader>ev', ':Eview<cr>')
nmap('<leader>ec', ':Econtroller<cr>')
nmap('<leader>ea', ':A<cr>')
nmap('<leader>er', ':R<cr>')
nmap('<leader>et', ':Rails<cr>') -- run test for selected file
