local opts = { noremap = true, silent = true }
-- map the leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

-- imap('<c-l>', '<right>') -- this breaks the backspase key
-- imap('<c-h>', '<left>')

-- Next two remaps allows to move line up and down in visual mode + autoindenting
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- Autocentering for half page scroll
nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')

nmap('<leader>w', ':w<cr>')
nmap('<leader>md', ':MarkdownPreview<cr>') -- start MarkdownPreview

-- Quickly insert an empty new line without entering insert mode
nmap('<Leader>o', 'o<Esc>0')
nmap('<Leader>O', 'O<Esc>0')

-- Toggle spell check
nmap('<leader>c', ':setlocal spell!<cr>')

-- for fugitive
nmap('<leader>gn', ':diffget //3<cr>')
nmap('<leader>gt', ':diffget //2<cr>')
nmap('<leader>gs', ':G<cr>')
nmap('<leader>gl', ':G log<cr>')
nmap('<leader>gc', ':G commit<cr>')
nmap('<leader>gp', ':G push<cr>')


-- for telecsope:
nmap('<leader>ff', ':Telescope find_files <cr>')
nmap('<leader>ft', ':Telescope live_grep <cr>')
nmap('<leader>fb', ':Telescope buffers<cr>')


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

-- nmap('S', '<cmd>%s//g<Left><Left>')
vim.cmd[[nnoremap S :%s//g<Left><Left>]] -- lua version ⬆️  doesn't seem to work
-- nmap('S', '<Plug>(findandreplace_n)')
nmap('s', ':HopChar2MW<cr>') -- to see all possible commands and choose what works for you -> ':Ho', tab and scroll through the results
nmap('<leader>tv', ':source %<cr>') -- source vim
nmap('<leader>tl', ':luafile %<cr>') -- source lua

-- formatting
nmap('<leader>a', ':lua vim.lsp.buf.formatting_sync()<cr>')

-- vim-rails:
nmap('<leader>em', ':Emodel<cr>')
nmap('<leader>ev', ':Eview<cr>')
nmap('<leader>ec', ':Econtroller<cr>')
nmap('<leader>ea', ':A<cr>')
nmap('<leader>er', ':R<cr>')
nmap('<leader>et', ':Rails<cr>') -- run test for selected file

-- harpoon:
nmap('<leader>a', ':lua require("harpoon.mark").add_file()<cr>')
nmap('<c-l>',':lua require("harpoon.ui").toggle_quick_menu()<cr>')

nmap('<c-n>',':lua require("harpoon.ui").nav_file(1)<cr>')
nmap('<c-e>',':lua require("harpoon.ui").nav_file(2)<cr>')
nmap('<c-i>',':lua require("harpoon.ui").nav_file(3)<cr>')
