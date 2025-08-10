-- 快速跳转
return {
    "smoka7/hop.nvim",
    opts = {
        -- 设置跳转位置为单词的尾部，默认是单词的首位
        hint_position = 3,
    },
    keys = {
        { "<leader>hp", ":HopWord<CR>", silent = true }
    }
}
