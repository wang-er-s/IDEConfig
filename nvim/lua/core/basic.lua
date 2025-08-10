vim.opt.number = true
vim.opt.relativenumber = true
-- 高亮当前行
vim.opt.cursorline = true
-- 行宽
vim.opt.colorcolumn = "80"
-- 把tab转成空格
vim.opt.expandtab = true
-- tab占4个空格
vim.opt.tabstop = 4
-- 开头tab占4个空格，等于0意味着与tabstop一致
vim.opt.shiftwidth = 0
-- 自动重新加载外部修改
vim.opt.autoread = true
-- 默认分屏是在右方和下方
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 如果输入小写，则忽略大小写，如果输入大写则匹配大小写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索完成不持续高亮
vim.opt.hlsearch = false
-- 禁用nvim的模式
vim.opt.showmode = false
