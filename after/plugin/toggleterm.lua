require'toggleterm'.setup{
	direction = "float",
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>', {noremap = true, silent = true, buffer = 0})
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
