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
nmap('<leader>n', ':NERDTreeToggle<cr>') -- nerd tree
nmap('<leader>mm', ':MaximizerToggle<cr>') -- toggle maximize for split/recover
nmap('<leader>eq', '<C-w>=') -- equalize size of splits
-- better moving management:
nmap('<leader>h', ':wincmd h <cr>')
nmap('<leader>j', ':wincmd j <cr>')
nmap('<leader>k', ':wincmd k <cr>')
nmap('<leader>l', ':wincmd l <cr>')

nmap('S', ':%s//g<Left><Left>')
nmap('<leader>vr', ':source %<CR>') -- source config if you are currently viewing him
