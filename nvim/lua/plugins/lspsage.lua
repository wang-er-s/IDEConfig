return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsage",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
	},
	keys = {
		{ "<leader>lR", ":Lspsaga rename<CR>" },
		-- 提供fix
		{ "<leader>lc", ":Lspsaga code_action<CR>" },
		-- 跳转定义
		{ "<leader>ld", ":Lspsaga goto_definition<CR>" },
		-- 帮助文档
		{ "<leader>lh", ":Lspsaga hover_doc<CR>" },
		-- 查找引用
		{ "<leader>lr", ":Lspsaga finder<CR>" },
		-- 跳转下一个 错误/警告/信息
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" },
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" },
	},
}
