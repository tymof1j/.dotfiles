-- local null_ls_status_ok, null_ls = pcall(require, "null-ls")
-- if not null_ls_status_ok then
--   return
-- end
--
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
--
-- null_ls.setup({
--   debug = false,
--   sources = {
--     formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
--     formatting.black.with({ extra_args = { "--fast" } }),
--     formatting.stylua,
--     formatting.rubocop,
--     -- diagnostics.flake8
--   },
-- })
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
    name = "rubocop",
    meta = {
        url = "https://github.com/rubocop/rubocop",
        description = "Ruby static code analyzer and formatter, based on the community Ruby style guide.",
    },
    method = FORMATTING,
    filetypes = { "ruby" },
    generator_opts = {
        command = "rubocop",
        args = {
            "--auto-correct",
            "-f",
            "quiet",
            "--stderr",
            "--stdin",
            "$FILENAME",
        },
        to_stdin = true,
    },
    factory = h.formatter_factory,
})
