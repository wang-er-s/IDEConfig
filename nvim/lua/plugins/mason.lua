return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig",
    },
    opts = {},
    config = function (_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")

        local function setup_lsp(name, config)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end

            local nvm_lsp = require("mason-lspconfig.mappings").get_mason_map()
                            .package_to_lspconfig['lua-language-server']
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            -- 禁用lsp的格式化功能，使用none-ls
            config.on_attach = function (client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
            require("lspconfig")[nvm_lsp].setup(config)
        end

        local lsp_servers = {
            ["lua-language-server"] = { settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }}}},
            ["pyright"] = {}
        }

        for name, config in pairs(lsp_servers) do
            setup_lsp(name, config)
        end
        require("mason-lspconfig").setup({})
        vim.cmd("LspStart")
        -- 启用右侧报错文本提示
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
    end
}
