-- 上边的tab栏
return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, _, _)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
            indicator = {
                style = "underline"
            }
		},
        highlights = {
            buffer_selected = {
                sp = "#EF6055",
                italic = false,
                bold = true
            },
        }
	},
	keys = {
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
		{ "<leader>bp", ":BufferLinePick<CR>", silent = true },
		-- 关闭其他
		{ "<leader>bC", ":BufferLineCloseOthers<CR>", silent = true },
		{ "<leader>bc", ":bdelete<CR>", silent = true },
	},
	lazy = false,
}
