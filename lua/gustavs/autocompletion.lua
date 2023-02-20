vim.cmd("inoremap ( ()<left>")
vim.cmd("inoremap [ []<left>")
vim.cmd("inoremap { {}<left>")
vim.cmd("inoremap \" \"\"<left>")
vim.cmd("inoremap {<CR> {<CR>}<C-o>O")

-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O
-- inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
-- inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
-- inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
-- inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
-- inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
