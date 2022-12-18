-- local status_ok, catppuccin = pcall(require, 'catppuccin')
-- if not status_ok then
--   return
-- end
-- vim.g.catppuccin_flavour = "macchiato"

vim.cmd [[
try
  colorscheme tokyonight-moon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
