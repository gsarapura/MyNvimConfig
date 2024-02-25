-- require('nvim-treesitter.configs').setup {
--   context_commentstring = {
--     enable = true,
--     enable_autocmd = false,
--     config = {
--       javascript = {
--         __default = '// %s',
--         jsx_element = '{/* %s */}',
--         jsx_fragment = '{/* %s */}',
--         jsx_attribute = '// %s',
--         comment = '// %s'
--       },
--       typescript = { __default = '// %s', __multiline = '/* %s */' }
--     }
--   }
-- }

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
