-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    print('hello tsserver')
  end,
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
})

-- New keybindings
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bind('n', '<leader>k', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  bind('n', '<leader>j', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  -- more keybindings...
end)


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
