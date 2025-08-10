vim.g.mapleader = " "
vim.keymap.set("n", "<Enter>", "<ESC>o<ESC>")
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("n", "<C-h>", "^")
vim.keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>")
vim.keymap.set({"n", "i"}, "<C-s>", "<Cmd>w<CR>")
-- ctrl + s保存
vim.keymap.set('n', '<C-s>', ':write<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { silent = true })
-- ctlr + v粘贴
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<C-r>+')
