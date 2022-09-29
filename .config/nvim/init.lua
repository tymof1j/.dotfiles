require 'tima.options'
require 'tima.keymaps'
require 'tima.plugins'
require 'tima.colorscheme'
require 'tima.statusline'
require 'tima.cmp'
require 'tima.lsp'
require 'tima.treesitter'
require 'tima.autopairs'
require 'tima.nvim_tree'
require 'tima.toggleterm'
require 'tima.autocommands'
require 'tima.rails_projections'
require 'tima.catppuccin'

local autocmd = vim.api.nvim_create_autocmd

-- vim.opt.transparent_window = 'true'
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      "SignColumn",
      "NormalNC",
      "TelescopeBorder",
      "NvimTreeNormal",
      "EndOfBuffer",
      "MsgArea",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})
vim.opt.fillchars = "eob: "

autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
