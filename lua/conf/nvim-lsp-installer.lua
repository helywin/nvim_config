-- https://github.com/williamboman/nvim-lsp-installer
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


local lsp_installer_servers = require("nvim-lsp-installer.servers")

-- WARN: 手动书写 LSP 配置文件
-- 名称：https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- 配置：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local install_servers = {
    -- 语言服务器名称：配置选项
    sumneko_lua = require("lsp.sumneko_lua"),
    clangd = require("lsp.clangd"),
    cmake = require("lsp.cmake"),
    jsonls = require("lsp.jsonls"),
    -- zeta_note = require("lsp.zeta_note"),
    bashls = require("lsp.bashls"),
    yamlls = require("lsp.yamlls"),
    lemminx = require("lsp.lemminx"),
    pyright = require("lsp.pyright"),
    rust_analyzer = require("lsp.rust_analyzer"),
    -- tsserver = require("lsp.tsserver"),
    -- html = require("lsp.html"),
    -- cssls = require("lsp.cssls"),
    -- gopls = require("lsp.gopls"),
    -- sqls = require("lsp.sqls"),
    -- vuels = require("lsp.vuels")
}


local opts = { noremap = true, silent = true }
-- 这里是 LSP 服务启动后的按键加载
local on_attach = function(client, bufnr)
    local present, lspsaga = pcall(require, "lspsaga")
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    if present then
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-p>', '<cmd>Lspsaga signature_help<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gn', '<cmd>Lspsaga rename<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>Lspsaga preview_definition<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    end
end


-- 自动安装或启动 LanguageServers
for server_name, server_options in pairs(install_servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- 判断服务是否可用
    if server_available then
        -- 判断服务是否准备就绪，若就绪则启动服务
        -- if server_name == "sumneko_lua" or
        --     server_name == "clangd" or
        --     server_name == "pyright" or
        --     server_name == "jsonls" then
        --     server_options.capabilities = capabilities
        -- end
        server:on_ready(
            function()
            -- keybind
            server_options.on_attach = on_attach

            -- options config
            server_options.flags = {
                debounce_text_changes = 150
            }
            -- 启动服务
            server:setup(server_options)
        end
        )
        -- 如果服务器没有下载，则通过 notify 插件弹出下载提示
        if not server:is_installed() then
            vim.notify("Install Language Server : " .. server_name, "WARN", { title = "Language Servers" })
            server:install()
        end
    end
end

-- setup gdscript
require'lspconfig'.gdscript.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
}
