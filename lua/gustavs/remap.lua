vim.g.mapleader = " "
-- Show tree directory:
-- vim.keymap.set("n", "<leader>e", vim.cmd.Rex)
-- Exit: 
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)

-- Saving:
vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- Previous/Next tabs:
vim.keymap.set("n", "<leader>bb", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
-- Close current tab;
vim.keymap.set("n", "<leader>c", vim.cmd.bd)

vim.keymap.set("n", "<c-\\>", vim.cmd.ToggleTerm)
-- TroubleDiagnostics 
-- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
vim.keymap.set("n", "<leader>d", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- NvimTree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- indent selected lines and keep selection on these lines
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', { noremap = true })
