local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require 'tima.lsp.configs'
-- require('tima.lsp.handlers').setup()
require 'tima.lsp.null-ls'
require 'tima.lsp.mason'
