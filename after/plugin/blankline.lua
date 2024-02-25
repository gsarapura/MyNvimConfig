vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#524f67 gui=nocombine]]
--

-- require("ibl").setup {
  -- show_end_of_line = true,
  -- show_current_context = true,
  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  -- },
-- }
local highlight = {
    "RainbowRed",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

require("ibl").setup {
    indent = {
        -- tab_char = { "a", "b", "c" },
        -- highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 2,
    },
    whitespace = {
        -- highlight = { "Whitespace", "NonText" }, 
        remove_blankline_trail = false
    },
    scope = {
        show_start = false,
        show_end = false,
        highlight = highlight,
        node_type = { lua = { "block", "chunk" } },
        priority = 500
    }
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
