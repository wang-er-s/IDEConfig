vim.g.mapleader = " "

local keymap = vim.keymap

-- -------插入模式-----------
keymap.set("i","<C-a>","<ESC>ggVG")

-- -------视觉模式-----------
keymap.set("v","<C-k>",":m '<-2<CR>gv=gv")
keymap.set("v","<C-j>",":m '>+1<CR>gv=gv")

-- -------正常模式-----------
keymap.set("n","<ENTER>","o<ESC>")
keymap.set("n","<C-a>","ggVG")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 插件
keymap.set("n", "<leader>m", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>l",":bnext<CR>")
keymap.set("n", "<leader>h",":bprevious<CR>")
