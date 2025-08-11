-- 需要cmake ripgrep
require("core.basic")
require("core.keymap")
require("core.lazy")

-- 追加写入日志文件
local function write_log(message)
	local log_file = "C:\\Users\\ss\\AppData\\Local\\nvim\\output.txt"
	local file = io.open(log_file, "a") -- 'a' 表示追加模式
	if file then
		local timestamp = os.date("%Y-%m-%d %H:%M:%S")
		file:write(string.format("[%s] %s\n", timestamp, message))
		file:close()
	else
		vim.notify("无法打开日志文件: " .. log_file, vim.log.levels.ERROR)
	end
end

-- 为了适配右键打开文件，因为右键打开会设置工作目录为默认目录
-- 这时候打开tree就会显示不是正确的 work tree
-- 所以判断如果是默认的目录，就会把工作目录改成文件所在的目录
-- 目前只写了windows的默认目录，有其他系统可以自己添加
local default_cwd = { "C:\\WINDOWS\\System32" }
vim.api.nvim_create_autocmd("BufEnter", { -- 创建一个自动命令，在"进入缓冲区"时触发
	pattern = "*", -- 匹配所有文件
	callback = function()
		local cwd = vim.fn.getcwd()
		for _, def_cwd in ipairs(default_cwd) do
			if def_cwd == cwd then
				if vim.fn.expand("%:p") ~= "" then -- 检查当前文件是否有完整路径（非空缓冲区）
					vim.cmd("cd %:p:h") -- 切换到当前文件所在目录
				end
				break
			end
		end
	end,
})
